Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id DD89976A4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:59:36 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so40058117wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PrryeSLoF1YF6wAHmigBx75EM9Z1RdnIejvM1QERuW4=;
	b=N39bLR/Xy36PmhPZxzzj9tWAQym5CADCWMFx1UbxbzMcxzuDmKA/FcCc6TMFxmmuMm
	nC4zXXL+cyEFEbW0aUfz3N+FnnR3ad3Y8L9ib4/TerT2i0DdoHNdW0a/dCI/BYq72Va/
	NJLBPAwqQ591dyLwpEKJtVG4mnZgSJg1vFSHfrUZUxicpYxROKIiZP8oGOWjHLjz0pDD
	Z1GBjpC2GqdamwQW+UcEEt7X/3TYMYYT8yNjpYqzajqXKfvOguRIwHDLI8YR4CykjJJ4
	bAA/vMP0LNDpcpQQYJnrQQJD5/kLvv2JM8cmWlTkS34wWszSPXIKWF7E/Dftf7feTRjC
	UGzQ==
X-Gm-Message-State: ALoCoQlyu0Q2ozSVobEdfhkiXNWylvSA2kVj3wk2jEXa7nos7mkNtFj/gyP0uYYExCI5CF/NwEM0
X-Received: by 10.194.78.164 with SMTP id c4mr6992903wjx.65.1440086375928;
	Thu, 20 Aug 2015 08:59:35 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by smtp.gmail.com with ESMTPSA id
	ma4sm6123545wjb.38.2015.08.20.08.59.34
	(version=TLS1_2 cipher=AES128-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:59:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 17:59:24 +0200
Message-Id: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][RFC][PATCH 0/5] Samba 4.x update
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
X-List-Received-Date: Thu, 20 Aug 2015 15:59:39 -0000

Here's what I currently have. I builds samba half of the times, heimdal probably needs some patches for the com_err header issue. Feel free to take these patches and run with them, I'll be mostly AFK for the rest of the month.


Bian Naimeng (2):
  waf-samba: add new class
  talloc: upgrade to 2.1.3

Koen Kooi (3):
  heimdal 1.6rc2: add buildtool for samba4
  samba: add 4.2.3
  samba: remove 3.x

 meta-oe/classes/waf-samba.bbclass                  |    51 +
 ...dm5-fix-race-in-Makefile-with-kadm5_err.h.patch |    34 +
 .../recipes-connectivity/samba/heimdal_1.6rc2.bb   |    49 +
 .../bug_221618_precise-64bit-prototype.patch       |    20 -
 ...4104_mention-kerberos-in-smbspool-manpage.patch |    34 -
 ...m_7499-nss_wins-dont-clobber-daemons-logs.patch |    47 -
 .../bug_601406_fix-perl-path-in-example.patch      |    15 -
 ...04768_upstream_7826_drop-using-samba-link.patch |    21 -
 ...ug_604768_upstream_7826_fix-WHATSNEW-link.patch |    18 -
 ...onfigure-disable-core_pattern-cross-check.patch |    20 -
 .../configure-disable-getaddrinfo-cross.patch      |    11 -
 .../samba/samba-3.6.24/configure-libunwind.patch   |    82 -
 .../samba/samba-3.6.24/documentation.patch         |   302 -
 .../samba/samba-3.6.24/documentation2.patch        |   314 -
 .../samba-3.6.24/dont-build-VFS-examples.patch     |    31 -
 .../samba/samba-3.6.24/fhs-filespaths.patch        |    65 -
 .../samba/samba-3.6.24/installswat.sh.patch        |    23 -
 .../samba-3.6.24/libutil_drop_AI_ADDRCONFIG.patch  |    54 -
 .../samba-3.6.24/only_export_public_symbols.patch  |    21 -
 .../samba/samba-3.6.24/pam-examples.patch          |    17 -
 .../samba/samba-3.6.24/shadow_copy2_backport.patch |  2101 ---
 .../samba/samba-3.6.24/smbclient-pager.patch       |    18 -
 .../samba/samba-3.6.24/smbtar-bashism.patch        |    19 -
 .../samba/samba-3.6.24/smbtorture-manpage.patch    |    94 -
 .../samba/samba-3.6.24/undefined-symbols.patch     |    24 -
 .../samba/samba-3.6.24/usershare.patch             |    38 -
 .../samba/samba-3.6.24/waf-as-source.patch         | 18534 -------------------
 .../samba/samba/cross-answers.txt                  |     1 +
 .../recipes-connectivity/samba/samba/nmb.service   |     3 +-
 .../recipes-connectivity/samba/samba/smb.service   |     3 +-
 .../samba/samba/winbind.service                    |     5 +-
 meta-oe/recipes-connectivity/samba/samba_3.6.24.bb |    67 -
 meta-oe/recipes-connectivity/samba/samba_git.bb    |   181 +
 .../install-swig-interface-in-SWINGLIBDIR.patch    |    23 -
 .../recipes-support/talloc/talloc/sepbuild.patch   |    27 -
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |    45 -
 meta-oe/recipes-support/talloc/talloc_2.1.3.bb     |    43 +
 37 files changed, 363 insertions(+), 22092 deletions(-)
 create mode 100644 meta-oe/classes/waf-samba.bbclass
 create mode 100644 meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_221618_precise-64bit-prototype.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_601406_fix-perl-path-in-example.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_drop-using-samba-link.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_fix-WHATSNEW-link.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-core_pattern-cross-check.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-getaddrinfo-cross.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-libunwind.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation2.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/dont-build-VFS-examples.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/fhs-filespaths.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/installswat.sh.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/libutil_drop_AI_ADDRCONFIG.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/only_export_public_symbols.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/pam-examples.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/shadow_copy2_backport.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/smbclient-pager.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtar-bashism.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtorture-manpage.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/undefined-symbols.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/usershare.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/waf-as-source.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/cross-answers.txt
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba_3.6.24.bb
 create mode 100644 meta-oe/recipes-connectivity/samba/samba_git.bb
 delete mode 100644 meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
 delete mode 100644 meta-oe/recipes-support/talloc/talloc/sepbuild.patch
 delete mode 100644 meta-oe/recipes-support/talloc/talloc_2.0.1.bb
 create mode 100644 meta-oe/recipes-support/talloc/talloc_2.1.3.bb

-- 
2.0.1


