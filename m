Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1ixl-0006E3-0t
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2012 21:09:05 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 11:56:01 -0700
Received: by weyt11 with SMTP id t11so1119845wey.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2012 11:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Yi9SyS1d8luc39dM85p+Qp2JhFfjmRKaYK0mUjThbAg=;
	b=bD3+hmWpCPHMc7JwBIRY9N+Yc3N95eH65mhUgRaDM7Yidrc6ObG68I3Jdp84jG1Rna
	/a6lk6clyAHrpUMRwneM0DXitp+1k28Nl4xG1RnBZlTwj5UE0rQhVJ34NVgqGGguLY9v
	vHNEZer8ogBD3W9/O4WV90YnvufeSpeMFIKNRBnjmy/epkjqgIvf2TcPMnK94hRR+Y//
	XyIWTRC3YlGGH8a9LLYq1nhF6XVzuSSbURU9EL39e/nFs4mbHJ1bBxV0QzXlWiEgGAAm
	SYSrVw+w7I6cYTH0NPw5im2HLv6uM6mBAad+tDjnrwv6fY1EZme1Z10ZpmjT46naZuXT
	OJLQ==
Received: by 10.216.153.207 with SMTP id f57mr11037927wek.196.1345056960018;
	Wed, 15 Aug 2012 11:56:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPS id el6sm30288572wib.8.2012.08.15.11.55.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 11:55:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Aug 2012 19:55:49 +0100
Message-Id: <1345056951-14036-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkYPtgsrEhTjUbmSBKlkKFwllsXW8EtkrLnXFPizsVdE51LaD41RrDWbd4+vg5C/0nFLiN5
Subject: [PATCH 0/2] Add evolution-data-server
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2012 19:09:05 -0000

As part of pruning Sato in oe-core, move libical and evolution-data-server to
meta-gnome.

Ross Burton (2):
  meta-gnome: add libical
  meta-gnome: add evolution-data-server

 .../avoid_automake_errors.patch                    |   83 ++++++++
 .../eds/evolution-data-server/depbuildfix.patch    |   78 ++++++++
 .../fix_for_automake-1.12.x.patch                  |   28 +++
 .../eds/evolution-data-server/iconv-detect.h       |    5 +
 .../evolution-data-server/new-contact-fix.patch    |   23 +++
 .../eds/evolution-data-server/nossl.patch          |   70 +++++++
 .../eds/evolution-data-server/oh-contact.patch     |  203 ++++++++++++++++++++
 .../eds/evolution-data-server/old-gdk-api.patch    |   19 ++
 .../optional_imapx_provider.patch                  |   64 ++++++
 .../recipes-gnome/eds/evolution-data-server_git.bb |  111 +++++++++++
 .../libical/files/pthread-fix.patch                |   52 +++++
 meta-gnome/recipes-support/libical/libical_0.48.bb |   17 ++
 12 files changed, 753 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/avoid_automake_errors.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildfix.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/fix_for_automake-1.12.x.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-detect.h
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/new-contact-fix.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/oh-contact.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-api.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/optional_imapx_provider.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
 create mode 100644 meta-gnome/recipes-support/libical/files/pthread-fix.patch
 create mode 100644 meta-gnome/recipes-support/libical/libical_0.48.bb

-- 
1.7.10.4



