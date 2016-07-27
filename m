Return-Path: <straka.derek@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id F0B43606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 15:55:10 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id cf3so1950983pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pcY274HkIzUMrzhPHMC41CBNeL+Xowm0Ktl4e3DTyZg=;
	b=fvqKZ1muqai+DrfS7F7XuvII3za64VyXeu26jqBVUCH1WL1o2T6HjcLQbGG4ZpGjxb
	JJKD6LzofP56cGycgIEfRkiApAHG942V73MrkuISDN0ifpuz6gQi/exi/HtQTodLkfqz
	zGjHbqgr2HW1A9oEPisdu8lyd0JNazSymN9QE7fieRnAIHXQPslaHFM4xcIdhq9Ic0Zk
	OnwMGwBfOB6WrpnOHqC1tj+CSmGZt9VueIesmy2HBTfXaSCWKZBDQYs8P28TaMcyakya
	b3oQ6P85UxMluC9LhxXKUQt92XQeanetyXaO5PWqlTTx2Aci/11CmEzDR4avLCXo3wQL
	UKzA==
X-Gm-Message-State: AEkoouvGGNSFv0+0U2h3XuopdXflJOYyQVNXhAgmS8tYzOJK/LInjuMQ8DYyThWM0Ehd6Q==
X-Received: by 10.66.175.45 with SMTP id bx13mr50277003pac.23.1469634910936;
	Wed, 27 Jul 2016 08:55:10 -0700 (PDT)
Received: from lnx-dereks-laptop.router
	(mobile-166-137-178-128.mycingular.net. [166.137.178.128])
	by smtp.gmail.com with ESMTPSA id
	c82sm10231851pfb.72.2016.07.27.08.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 08:55:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2016 11:54:38 -0400
Message-Id: <1469634878-28432-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] webmin: upgrade to version 1.801
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
X-List-Received-Date: Wed, 27 Jul 2016 15:55:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../webmin/files/disable-version-check.patch       | 48 +++++++++++++++-------
 .../webmin/{webmin_1.750.bb => webmin_1.801.bb}    |  4 +-
 2 files changed, 36 insertions(+), 16 deletions(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_1.750.bb => webmin_1.801.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
index a9ee405..1ca1480 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
@@ -11,7 +11,7 @@ diff --git a/webmin/webmin-lib.pl b/webmin/webmin-lib.pl
 index 57a37f7..838b944 100755
 --- a/webmin/webmin-lib.pl
 +++ b/webmin/webmin-lib.pl
-@@ -1059,18 +1059,19 @@ my %miniserv;
+@@ -1086,28 +1086,28 @@
  &load_theme_library();	# So that UI functions work
  
  # Need OS upgrade
@@ -20,26 +20,46 @@ index 57a37f7..838b944 100755
 -     $realos{'os_type'} ne $gconfig{'os_type'}) &&
 -    $realos{'os_version'} && $realos{'os_type'} &&
 -    &foreign_available("webmin")) {
--	push(@notifs, 
--		&ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
--		&text('os_incorrect', $realos{'real_os_type'},
--				    $realos{'real_os_version'})."<p>\n".
--		&ui_form_end([ [ undef, $text{'os_fix'} ] ])
--		);
+-	my ($realminor) = split(/\./, $realos{'os_version'});
+-	my ($minor) = split(/\./, $gconfig{'os_version'});
+-	if ($realos{'os_type'} eq $gconfig{'os_type'} &&
+-	    $realminor == $minor) {
+-		# Only the minor version number changed - no need to apply
+-		&apply_new_os_version(\%realos);
+-		}
+-	else {
+-		# Large enough change to tell the user
+-		push(@notifs, 
+-		    &ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
+-		    &text('os_incorrect', $realos{'real_os_type'},
+-		    		          $realos{'real_os_version'})."<p>\n".
+-		    &ui_form_end([ [ undef, $text{'os_fix'} ] ])
+-		    );
+-		}
 -	}
-+# Disabled for now as os-chooser.pl does not work on our system
 +#my %realos = &detect_operating_system(undef, 1);
 +#if (($realos{'os_version'} ne $gconfig{'os_version'} ||
 +#     $realos{'os_type'} ne $gconfig{'os_type'}) &&
 +#    $realos{'os_version'} && $realos{'os_type'} &&
 +#    &foreign_available("webmin")) {
-+#	push(@notifs, 
-+#		&ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
-+#		&text('os_incorrect', $realos{'real_os_type'},
-+#				    $realos{'real_os_version'})."<p>\n".
-+#		&ui_form_end([ [ undef, $text{'os_fix'} ] ])
-+#		);
++#	my ($realminor) = split(/\./, $realos{'os_version'});
++#	my ($minor) = split(/\./, $gconfig{'os_version'});
++#	if ($realos{'os_type'} eq $gconfig{'os_type'} &&
++#	    $realminor == $minor) {
++#		# Only the minor version number changed - no need to apply
++#		&apply_new_os_version(\%realos);
++#		}
++#	else {
++#		# Large enough change to tell the user
++#		push(@notifs, 
++#		    &ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
++#		    &text('os_incorrect', $realos{'real_os_type'},
++#		    		          $realos{'real_os_version'})."<p>\n".
++#		    &ui_form_end([ [ undef, $text{'os_fix'} ] ])
++#		    );
++#		}
 +#	}
  
  # Password close to expiry
  my $warn_days = $config{'warn_days'};
+
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
index 34052a1..3fc083a 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
@@ -20,8 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
             "
 
-SRC_URI[md5sum] = "4007c390323d840f26c2e0f43c5c81a3"
-SRC_URI[sha256sum] = "5111f820adc6fbca997a58d4b2fa186dac6cded9cff0e70724f8cae6021123d9"
+SRC_URI[md5sum] = "91d05b4e31ad1bd14bab14e0f155c088"
+SRC_URI[sha256sum] = "ad477edb41dc1a900448afc8b5528e136b3778d2d303f23bc564afb975eb5bed"
 
 inherit perlnative update-rc.d
 
-- 
1.9.1


