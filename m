Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE0773DF0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:10:38 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so110531310pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oKVy/x+/qQx2O3OCNzlAkOqDXl3zTVnLcOc/rFLBKnI=;
	b=Ijn8oijnBTfg6MeVFRq69/z8y7JVPVhfBwFkOvqlAocvl9eOdnk7eCeA7EpxyhysW0
	lUq1HkDALTUrpCBmelS6d3Mn3uBJ//aUnZ2QGwfkcqkSssnPVDrG4kN0hTEgaMWhImVO
	RjTgDSqRrduOJTQUETMjQ5KbcSffuN3TGGxhMXQ4i67k3eY7Fp7vReuJ92eMkgOHJST1
	woBifWC9Y8A5NpSZNyZ3aYBibtmK2H9yd/5EJMM+loZR/rIv00g1ebvj0pVCDDL9p2Sc
	QBp32HW15R2b+Y1L0zLiHg2zHSHrnFxphrF4xPcr8fFhfIWXl2M303IsB28QDOQZ/NZD
	vorA==
X-Gm-Message-State: ALoCoQlGA8BYsI6WTKxrWqqx0k3ikV6FAFCyyK3Dq4owl7WPj4l2kpFWdsKEmIxKsQutjq6dUc1p
X-Received: by 10.68.133.68 with SMTP id pa4mr3577437pbb.71.1439824238540;
	Mon, 17 Aug 2015 08:10:38 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	kp5sm15022374pdb.57.2015.08.17.08.10.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Aug 2015 08:10:38 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2015 20:40:21 +0530
Message-Id: <1439824222-14425-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [meta-networking][PATCH 1/2] mime-construct: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2015 15:10:39 -0000

mime-construct constructs and (by default) mails MIME messages.
It is entirely driven from the command line, it is
designed to be used by other programs, or people who act
like programs."

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../mime-construct/files/Signal.pm                 | 132 +++++++++++++++
 .../mime-construct/files/WaitStat.pm               | 178 +++++++++++++++++++++
 .../mime-construct/mime-construct_1.11.bb          |  31 ++++
 3 files changed, 341 insertions(+)
 create mode 100644 meta-networking/recipes-extended/mime-construct/files/Signal.pm
 create mode 100644 meta-networking/recipes-extended/mime-construct/files/WaitStat.pm
 create mode 100644 meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb

diff --git a/meta-networking/recipes-extended/mime-construct/files/Signal.pm b/meta-networking/recipes-extended/mime-construct/files/Signal.pm
new file mode 100644
index 0000000..9280e88
--- /dev/null
+++ b/meta-networking/recipes-extended/mime-construct/files/Signal.pm
@@ -0,0 +1,132 @@
+# $Id: Signal.pm,v 1.4 1998-10-27 16:16:13-05 roderick Exp $
+#
+# Copyright (c) 1997 Roderick Schertler.  All rights reserved.  This
+# program is free software; you can redistribute it and/or modify it
+# under the same terms as Perl itself.
+
+package IPC::Signal;
+
+use 5.003_94;	# __PACKAGE__
+use strict;
+use vars	qw($VERSION @ISA @EXPORT_OK $AUTOLOAD %Sig_num @Sig_name);
+
+require Exporter;
+
+$VERSION	= '1.00';
+@ISA		= qw(Exporter);
+@EXPORT_OK	= qw(sig_num sig_name sig_translate_setup %Sig_num @Sig_name);
+%Sig_num	= ();
+@Sig_name	= ();
+
+sub sig_num  ($);
+sub sig_name ($);
+
+sub sig_translate_setup () {
+    return if %Sig_num && @Sig_name;
+
+    require Config;
+
+    # In 5.005 the sig_num entries are comma separated and there's a
+    # trailing 0.
+    my $num = $Config::Config{'sig_num'};
+    if ($num =~ s/,//g) {
+	$num =~ s/\s+0$//;
+    }
+
+    my @name	= split ' ', $Config::Config{'sig_name'};
+    my @num	= split ' ', $num;
+
+    @name			or die 'No signals defined';
+    @name == @num		or die 'Signal name/number mismatch';
+
+    @Sig_num{@name} = @num;
+    keys %Sig_num == @name	or die 'Duplicate signal names present';
+    for (@name) {
+	$Sig_name[$Sig_num{$_}] = $_
+	    unless defined $Sig_name[$Sig_num{$_}];
+    }
+}
+
+# This autoload routine just is just for sig_num() and sig_name().  It
+# calls sig_translate_setup() and then snaps the real function definitions
+# into place.
+
+sub AUTOLOAD {
+    if ($AUTOLOAD ne __PACKAGE__ . '::sig_num'
+	    && $AUTOLOAD ne __PACKAGE__ . '::sig_name') {
+	require Carp;
+	Carp::croak("Undefined subroutine &$AUTOLOAD called");
+    }
+    sig_translate_setup;
+    *sig_num  = sub ($) { $Sig_num{$_[0]} };
+    *sig_name = sub ($) { $Sig_name[$_[0]] };
+    goto &$AUTOLOAD;
+}
+
+1
+
+__END__
+
+=head1 NAME
+
+IPC::Signal - Utility functions dealing with signals
+
+=head1 SYNOPSIS
+
+    $number = sig_num $name;
+    $name   = sig_name $number;
+
+    sig_translate_setup;
+    $number = $Sig_num{$name};
+    $name   = $Sig_name[$number];
+
+=head1 DESCRIPTION
+
+This module contains utility functions for dealing with signals.
+
+Nothing is exported by default.
+
+=over
+
+=item B<sig_num> I<chopped-signal-name>
+
+Returns the signal number of the signal whose name (sans C<SIG>) is
+I<chopped-signal-name>, or undef if there is no such signal.
+
+This function is prototyped to take a single scalar argument.
+
+=item B<sig_name> I<signal-number>
+
+Returns the chopped signal name (like C<HUP>) of signal number
+I<signal-number>, or undef if there is no such signal.
+
+This function is prototyped to take a single scalar argument.
+
+=item B<sig_translate_setup>
+
+If you want to use the @Sig_name and %Sig_num variables directly you must
+call B<sig_translate_setup> to initialize them.  This isn't necessary if
+you only use the function interfaces sig_name() and sig_num().
+
+This function is prototyped to take no arguments.
+
+=item B<%Sig_num>
+
+A hash with chopped signal name keys (like C<HUP>) and integer signal
+number values.
+
+=item B<@Sig_name>
+
+An array mapping signal numbers to chopped signal names (like C<HUP>).
+
+=back
+
+=head1 AUTHOR
+
+Roderick Schertler <F<roderick@argon.org>>
+
+=head1 SEE ALSO
+
+perl(1).
+
+=cut
diff --git a/meta-networking/recipes-extended/mime-construct/files/WaitStat.pm b/meta-networking/recipes-extended/mime-construct/files/WaitStat.pm
new file mode 100644
index 0000000..337e52a
--- /dev/null
+++ b/meta-networking/recipes-extended/mime-construct/files/WaitStat.pm
@@ -0,0 +1,178 @@
+# $Id: WaitStat.pm,v 1.3 1999-10-21 12:39:43-04 roderick Exp $
+#
+# Copyright (c) 1997 Roderick Schertler.  All rights reserved.  This
+# program is free software; you can redistribute it and/or modify it
+# under the same terms as Perl itself.
+
+=head1 NAME
+
+Proc::WaitStat - Interpret and act on wait() status values
+
+=head1 SYNOPSIS
+
+    $description = waitstat $?;
+    exit waitstat_reuse $?;
+    waitstat_die $?, 'program-name';
+    close_die COMMAND, 'program-name';
+
+=head1 DESCRIPTION
+
+This module contains functions for interpreting and acting on wait
+status values.
+
+Nothing is exported by default.
+
+=over
+
+=cut
+
+package Proc::WaitStat;
+
+use 5.003_98;	# piped close errno resetting
+use strict;
+use vars	qw($VERSION @ISA @EXPORT_OK);
+
+use Carp	qw(croak);
+use Exporter	  ();
+use IPC::Signal	qw(sig_name);
+use POSIX	qw(:sys_wait_h);
+
+$VERSION	= '1.00';
+@ISA		= qw(Exporter);
+@EXPORT_OK	= qw(waitstat waitstat_reuse waitstat_die close_die);
+
+=item B<waitstat> I<wait-status>
+
+Returns a string representation of wait() status value I<wait-status>.
+Values returned are like C<"0"> and C<"64"> and C<"killed (SIGHUP)">.
+
+This function is prototyped to take a single scalar argument.
+
+=cut
+
+sub waitstat ($) {
+    my $status = shift;
+
+    if (WIFEXITED $status) {
+	WEXITSTATUS $status
+    }
+    elsif (WIFSIGNALED $status) {
+	# XXX WCOREDUMP
+	'killed (SIG' . sig_name(WTERMSIG $status) . ')'
+    }
+    elsif (WIFSTOPPED $status) {
+	'stopped (SIG' . sig_name(WSTOPSIG $status) . ')'
+    }
+    # XXX WIFCONTINUED
+    else {
+	"invalid wait status $status"
+    }
+}
+
+=item B<waitstat_reuse> I<wait-status>
+
+Turn I<wait-status> into a value which can be passed to B<exit>, converted
+in the same manner the shell uses.  If I<wait-status> indicates a normal
+exit, return the exit value.  If I<wait-status> instead indicates death by
+signal, return 128 plus the signal number.
+
+This function is prototyped to take a single scalar argument.
+
+=cut
+
+sub waitstat_reuse ($) {
+    my $status = shift;
+
+    if (WIFEXITED $status) {
+	WEXITSTATUS $status
+    }
+    elsif (WIFSIGNALED $status) {
+	128 + WTERMSIG $status
+    }
+    elsif (WIFSTOPPED $status) {
+	128 + WSTOPSIG $status
+    }
+    else {
+	croak "Invalid wait status $status";
+    }
+}
+
+=item B<waitstat_die> I<wait-status> I<program-name>
+
+die() if I<wait-status> is non-zero (mentioning I<program-name> as the
+source of the error).
+
+This function is prototyped to take two scalar arguments.
+
+=cut
+
+sub waitstat_die ($$) {
+    my ($status, $program) = @_;
+    croak "Non-zero exit (" . waitstat($status) .
+	    ") from $program"
+	if $status;
+}
+
+=item B<close_die> I<filehandle> I<name>
+
+Close I<filehandle>, if that fails die() with an appropriate message
+which refers to I<name>.  This handles failed closings of both programs
+and files properly.
+
+This function is prototyped to take a filehandle (actually, a glob ref)
+and a scalar.
+
+=cut
+
+sub close_die (*$) {
+    my ($fh, $name) = @_;
+
+    unless (ref $fh || ref \$fh eq 'GLOB') {
+	require Symbol;
+	$fh = Symbol::qualify_to_ref($fh, caller);
+    }
+
+    unless (close $fh) {
+	croak "Error closing $name: ",
+		$!+0 ? "$!" : 'non-zero exit (' . waitstat($?) . ')';
+    }
+}
+
+1
+
+__END__
+
+=back
+
+=head1 EXAMPLES
+
+    close SENDMAIL;
+    exit if $? == 0;
+    log "sendmail failure: ", waitstat $?;
+    exit EX_TEMPFAIL;
+
+    $pid == waitpid $pid, 0 or croak "Failed to reap $pid: $!";
+    exit waitstat_reuse $?;
+
+    $output = `some-program -with args`;
+    waitstat_die $?, 'some-program';
+    print "Output from some-process:\n", $output;
+
+    open PROGRAM, '| post-processor' or die "Can't fork: $!";
+    while (<IN>) {
+    	print PROGRAM pre_process $_
+	    or die "Error writing to post-processor: $!";
+    }
+    # This handles both flush failures at close time and a non-zero exit
+    # from the subprocess.
+    close_die PROGRAM, 'post-processor';
+
+=head1 AUTHOR
+
+Roderick Schertler <F<roderick@argon.org>>
+
+=head1 SEE ALSO
+
+perl(1), IPC::Signal(3pm).
+
+=cut
diff --git a/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
new file mode 100644
index 0000000..e6dde3a
--- /dev/null
+++ b/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Construct and optionally mail MIME messages"
+DESCRIPTION = "Constructs and (by default) mails MIME messages. \
+               It is entirely driven from the command line, it is \
+               designed to be used by other programs, or people who act \
+               like programs."
+HOMEPAGE = "http://search.cpan.org/~rosch/mime-construct/mime-construct"
+SECTION = "mail"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=5e2e5da619ac8ef8c84767ccc4656e96"
+
+PR = "r0"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/mime-construct-${PV}.tar.gz \
+           file://WaitStat.pm \
+           file://Signal.pm \
+          "
+SRC_URI[md5sum] = "73834ea780fbea81b89dbd9b2fb54f58"
+SRC_URI[sha256sum] = "4cd7bb61b51d41192d1498c1051aa6a4ccd75aeb09b71d2ec706a7084a4a9303"
+
+inherit cpan
+
+do_install () {
+    oe_runmake install DESTDIR="${D}"
+    install -d ${D}${libdir}/perl/vendor_perl/${@get_perl_version(d)}/Proc \
+               ${D}${libdir}/perl/vendor_perl/${@get_perl_version(d)}/IPC
+    install -m 644 ${WORKDIR}/WaitStat.pm \
+                   ${D}${libdir}/perl/vendor_perl/${@get_perl_version(d)}/Proc
+    install -m 644 ${WORKDIR}/Signal.pm \
+                   ${D}${libdir}/perl/vendor_perl/${@get_perl_version(d)}/IPC
+}
+RDEPENDS_${PN} = "postfix perl"
-- 
1.8.2.3


