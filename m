Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9837D6FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2015 08:30:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB38UUji002714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2015 00:30:30 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 3 Dec 2015 00:30:29 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Dec 2015 16:18:47 +0800
Message-ID: <1449130728-4066-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
References: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/4] mime-construct: update runtime dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Dec 2015 08:30:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update runtime dependencies of mime-construct:

* drop WaitStat.pm and Signal.pm which are from libproc-waitstat-perl
  and its dependency libipc-signal-perl
* add patch to return 0 for option '--help'
* replace postfix with msmtp which is more lightweight
* add perl modules which are required for mime-construct to run

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mime-construct/files/Signal.pm                 | 132 ---------------
 .../mime-construct/files/WaitStat.pm               | 178 ---------------------
 .../fix-mime-construct-help-return-value.patch     |  39 +++++
 .../mime-construct/mime-construct_1.11.bb          |  19 +--
 4 files changed, 45 insertions(+), 323 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/mime-construct/files/Signal.pm
 delete mode 100644 meta-networking/recipes-extended/mime-construct/files/WaitStat.pm
 create mode 100644 meta-networking/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch

diff --git a/meta-networking/recipes-extended/mime-construct/files/Signal.pm b/meta-networking/recipes-extended/mime-construct/files/Signal.pm
deleted file mode 100644
index 9280e88..0000000
--- a/meta-networking/recipes-extended/mime-construct/files/Signal.pm
+++ /dev/null
@@ -1,132 +0,0 @@
-# $Id: Signal.pm,v 1.4 1998-10-27 16:16:13-05 roderick Exp $
-#
-# Copyright (c) 1997 Roderick Schertler.  All rights reserved.  This
-# program is free software; you can redistribute it and/or modify it
-# under the same terms as Perl itself.
-
-package IPC::Signal;
-
-use 5.003_94;	# __PACKAGE__
-use strict;
-use vars	qw($VERSION @ISA @EXPORT_OK $AUTOLOAD %Sig_num @Sig_name);
-
-require Exporter;
-
-$VERSION	= '1.00';
-@ISA		= qw(Exporter);
-@EXPORT_OK	= qw(sig_num sig_name sig_translate_setup %Sig_num @Sig_name);
-%Sig_num	= ();
-@Sig_name	= ();
-
-sub sig_num  ($);
-sub sig_name ($);
-
-sub sig_translate_setup () {
-    return if %Sig_num && @Sig_name;
-
-    require Config;
-
-    # In 5.005 the sig_num entries are comma separated and there's a
-    # trailing 0.
-    my $num = $Config::Config{'sig_num'};
-    if ($num =~ s/,//g) {
-	$num =~ s/\s+0$//;
-    }
-
-    my @name	= split ' ', $Config::Config{'sig_name'};
-    my @num	= split ' ', $num;
-
-    @name			or die 'No signals defined';
-    @name == @num		or die 'Signal name/number mismatch';
-
-    @Sig_num{@name} = @num;
-    keys %Sig_num == @name	or die 'Duplicate signal names present';
-    for (@name) {
-	$Sig_name[$Sig_num{$_}] = $_
-	    unless defined $Sig_name[$Sig_num{$_}];
-    }
-}
-
-# This autoload routine just is just for sig_num() and sig_name().  It
-# calls sig_translate_setup() and then snaps the real function definitions
-# into place.
-
-sub AUTOLOAD {
-    if ($AUTOLOAD ne __PACKAGE__ . '::sig_num'
-	    && $AUTOLOAD ne __PACKAGE__ . '::sig_name') {
-	require Carp;
-	Carp::croak("Undefined subroutine &$AUTOLOAD called");
-    }
-    sig_translate_setup;
-    *sig_num  = sub ($) { $Sig_num{$_[0]} };
-    *sig_name = sub ($) { $Sig_name[$_[0]] };
-    goto &$AUTOLOAD;
-}
-
-1
-
-__END__
-
-=head1 NAME
-
-IPC::Signal - Utility functions dealing with signals
-
-=head1 SYNOPSIS
-
-    $number = sig_num $name;
-    $name   = sig_name $number;
-
-    sig_translate_setup;
-    $number = $Sig_num{$name};
-    $name   = $Sig_name[$number];
-
-=head1 DESCRIPTION
-
-This module contains utility functions for dealing with signals.
-
-Nothing is exported by default.
-
-=over
-
-=item B<sig_num> I<chopped-signal-name>
-
-Returns the signal number of the signal whose name (sans C<SIG>) is
-I<chopped-signal-name>, or undef if there is no such signal.
-
-This function is prototyped to take a single scalar argument.
-
-=item B<sig_name> I<signal-number>
-
-Returns the chopped signal name (like C<HUP>) of signal number
-I<signal-number>, or undef if there is no such signal.
-
-This function is prototyped to take a single scalar argument.
-
-=item B<sig_translate_setup>
-
-If you want to use the @Sig_name and %Sig_num variables directly you must
-call B<sig_translate_setup> to initialize them.  This isn't necessary if
-you only use the function interfaces sig_name() and sig_num().
-
-This function is prototyped to take no arguments.
-
-=item B<%Sig_num>
-
-A hash with chopped signal name keys (like C<HUP>) and integer signal
-number values.
-
-=item B<@Sig_name>
-
-An array mapping signal numbers to chopped signal names (like C<HUP>).
-
-=back
-
-=head1 AUTHOR
-
-Roderick Schertler <F<roderick@argon.org>>
-
-=head1 SEE ALSO
-
-perl(1).
-
-=cut
diff --git a/meta-networking/recipes-extended/mime-construct/files/WaitStat.pm b/meta-networking/recipes-extended/mime-construct/files/WaitStat.pm
deleted file mode 100644
index 337e52a..0000000
--- a/meta-networking/recipes-extended/mime-construct/files/WaitStat.pm
+++ /dev/null
@@ -1,178 +0,0 @@
-# $Id: WaitStat.pm,v 1.3 1999-10-21 12:39:43-04 roderick Exp $
-#
-# Copyright (c) 1997 Roderick Schertler.  All rights reserved.  This
-# program is free software; you can redistribute it and/or modify it
-# under the same terms as Perl itself.
-
-=head1 NAME
-
-Proc::WaitStat - Interpret and act on wait() status values
-
-=head1 SYNOPSIS
-
-    $description = waitstat $?;
-    exit waitstat_reuse $?;
-    waitstat_die $?, 'program-name';
-    close_die COMMAND, 'program-name';
-
-=head1 DESCRIPTION
-
-This module contains functions for interpreting and acting on wait
-status values.
-
-Nothing is exported by default.
-
-=over
-
-=cut
-
-package Proc::WaitStat;
-
-use 5.003_98;	# piped close errno resetting
-use strict;
-use vars	qw($VERSION @ISA @EXPORT_OK);
-
-use Carp	qw(croak);
-use Exporter	  ();
-use IPC::Signal	qw(sig_name);
-use POSIX	qw(:sys_wait_h);
-
-$VERSION	= '1.00';
-@ISA		= qw(Exporter);
-@EXPORT_OK	= qw(waitstat waitstat_reuse waitstat_die close_die);
-
-=item B<waitstat> I<wait-status>
-
-Returns a string representation of wait() status value I<wait-status>.
-Values returned are like C<"0"> and C<"64"> and C<"killed (SIGHUP)">.
-
-This function is prototyped to take a single scalar argument.
-
-=cut
-
-sub waitstat ($) {
-    my $status = shift;
-
-    if (WIFEXITED $status) {
-	WEXITSTATUS $status
-    }
-    elsif (WIFSIGNALED $status) {
-	# XXX WCOREDUMP
-	'killed (SIG' . sig_name(WTERMSIG $status) . ')'
-    }
-    elsif (WIFSTOPPED $status) {
-	'stopped (SIG' . sig_name(WSTOPSIG $status) . ')'
-    }
-    # XXX WIFCONTINUED
-    else {
-	"invalid wait status $status"
-    }
-}
-
-=item B<waitstat_reuse> I<wait-status>
-
-Turn I<wait-status> into a value which can be passed to B<exit>, converted
-in the same manner the shell uses.  If I<wait-status> indicates a normal
-exit, return the exit value.  If I<wait-status> instead indicates death by
-signal, return 128 plus the signal number.
-
-This function is prototyped to take a single scalar argument.
-
-=cut
-
-sub waitstat_reuse ($) {
-    my $status = shift;
-
-    if (WIFEXITED $status) {
-	WEXITSTATUS $status
-    }
-    elsif (WIFSIGNALED $status) {
-	128 + WTERMSIG $status
-    }
-    elsif (WIFSTOPPED $status) {
-	128 + WSTOPSIG $status
-    }
-    else {
-	croak "Invalid wait status $status";
-    }
-}
-
-=item B<waitstat_die> I<wait-status> I<program-name>
-
-die() if I<wait-status> is non-zero (mentioning I<program-name> as the
-source of the error).
-
-This function is prototyped to take two scalar arguments.
-
-=cut
-
-sub waitstat_die ($$) {
-    my ($status, $program) = @_;
-    croak "Non-zero exit (" . waitstat($status) .
-	    ") from $program"
-	if $status;
-}
-
-=item B<close_die> I<filehandle> I<name>
-
-Close I<filehandle>, if that fails die() with an appropriate message
-which refers to I<name>.  This handles failed closings of both programs
-and files properly.
-
-This function is prototyped to take a filehandle (actually, a glob ref)
-and a scalar.
-
-=cut
-
-sub close_die (*$) {
-    my ($fh, $name) = @_;
-
-    unless (ref $fh || ref \$fh eq 'GLOB') {
-	require Symbol;
-	$fh = Symbol::qualify_to_ref($fh, caller);
-    }
-
-    unless (close $fh) {
-	croak "Error closing $name: ",
-		$!+0 ? "$!" : 'non-zero exit (' . waitstat($?) . ')';
-    }
-}
-
-1
-
-__END__
-
-=back
-
-=head1 EXAMPLES
-
-    close SENDMAIL;
-    exit if $? == 0;
-    log "sendmail failure: ", waitstat $?;
-    exit EX_TEMPFAIL;
-
-    $pid == waitpid $pid, 0 or croak "Failed to reap $pid: $!";
-    exit waitstat_reuse $?;
-
-    $output = `some-program -with args`;
-    waitstat_die $?, 'some-program';
-    print "Output from some-process:\n", $output;
-
-    open PROGRAM, '| post-processor' or die "Can't fork: $!";
-    while (<IN>) {
-    	print PROGRAM pre_process $_
-	    or die "Error writing to post-processor: $!";
-    }
-    # This handles both flush failures at close time and a non-zero exit
-    # from the subprocess.
-    close_die PROGRAM, 'post-processor';
-
-=head1 AUTHOR
-
-Roderick Schertler <F<roderick@argon.org>>
-
-=head1 SEE ALSO
-
-perl(1), IPC::Signal(3pm).
-
-=cut
diff --git a/meta-networking/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch b/meta-networking/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch
new file mode 100644
index 0000000..5e4281d
--- /dev/null
+++ b/meta-networking/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch
@@ -0,0 +1,39 @@
+From 2b9ed06850410d70371b31de5f131e484ba1c851 Mon Sep 17 00:00:00 2001
+From: Lu Chong <Chong.Lu@windriver.com>
+Date: Thu, 17 Oct 2013 16:06:04 +0800
+Subject: [PATCH] fix mime-construct --help return value
+
+Upstream-Status: Pending
+
+Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
+
+---
+ mime-construct |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/mime-construct b/mime-construct
+index cad7d0e..707ed19 100755
+--- a/mime-construct
++++ b/mime-construct
+@@ -39,7 +39,7 @@ usage: $Me switch...
+ 
+   Global settings:
+     --debug		turn debugging on
+-    --help		show this and then die
++    --help		show this
+     --output		don\'t mail, output to stdout (loses bcc info)
+     --subpart		generate subpart rather than whole message (turns
+     	    	    	on --output, changes other semantics a bit)
+@@ -150,7 +150,8 @@ sub xwarn {
+ 
+ sub usage {
+     xwarn @_ if @_;
+-    die $Usage;
++    print $Usage;
++    exit 0;
+ }
+ 
+ sub init {
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
index bf42a30..9f1a779 100644
--- a/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
+++ b/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
@@ -9,21 +9,14 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=5e2e5da619ac8ef8c84767ccc4656e96"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/mime-construct-${PV}.tar.gz \
-           file://WaitStat.pm \
-           file://Signal.pm \
-          "
+    file://fix-mime-construct-help-return-value.patch \
+"
+
 SRC_URI[md5sum] = "73834ea780fbea81b89dbd9b2fb54f58"
 SRC_URI[sha256sum] = "4cd7bb61b51d41192d1498c1051aa6a4ccd75aeb09b71d2ec706a7084a4a9303"
 
 inherit cpan
 
-do_install () {
-    oe_runmake install DESTDIR="${D}"
-    install -d ${D}${libdir}/perl/vendor_perl/${@get_perl_version(d)}/Proc \
-               ${D}${libdir}/perl/vendor_perl/${@get_perl_version(d)}/IPC
-    install -m 644 ${WORKDIR}/WaitStat.pm \
-                   ${D}${libdir}/perl/vendor_perl/${@get_perl_version(d)}/Proc
-    install -m 644 ${WORKDIR}/Signal.pm \
-                   ${D}${libdir}/perl/vendor_perl/${@get_perl_version(d)}/IPC
-}
-RDEPENDS_${PN} = "postfix perl"
+RDEPENDS_${PN} = "libmime-types-perl libproc-waitstat-perl msmtp \
+    perl-module-filehandle perl-module-mime-base64 perl-module-mime-quotedprint perl-module-posix \
+"
-- 
2.6.1


