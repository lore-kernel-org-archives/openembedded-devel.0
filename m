Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ea-0007gc-S5
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:35 +0100
Received: by mail-wi0-f169.google.com with SMTP id c10so36482wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=wbPDfPs0RNvcU5AGuZVv8Z9ZhDDQ/s3SPX8zfYAkrI4=;
	b=NBtOMel8Ec2Rz3o3RLaqsYzHoDKFwPw5dh2ZQ9oeuQGmHDj9+GXzsL+1yK9YUbqdUf
	6Vacfsg6dOju/kua9TGmqTQ2JNLKOAaxBxEJ4xMj2IKKHdabKxCUROd7npjLCWGnF/pP
	hmoDpIA3r2Y0yXiIoXmx5CoXj9BPNTga67dgxjI7T57vLbn6k91TV57QuuEupZ7Z5wQj
	7cUOURgPkXOTUCkbf8thyLn98m0/Y6vkR7Tn8vTlzU0WoSMsZyx9Z9NBaBtFehXHjti4
	P09Wq4NLEvpmHmPkdH8U/EJn2PgQN+3VmHSuG30vI6970K+aniSg2ukawtDDp9Ximann
	hZ0Q==
X-Received: by 10.194.158.161 with SMTP id wv1mr4741498wjb.38.1363974099061;
	Fri, 22 Mar 2013 10:41:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:26 +0000
Message-Id: <94f31413dfa8c338acad119fe886441bbb80549a.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlB2dW6ycRArvuMchf8peNDE87BCGfcBWkPlo6jUDcvDqjlRdqF449w0WTz5VTMUVEj9pOY
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/22] systemd: don't depend on the PCI/USB databases
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:26 -0000

systemd ships its own databases (hwdb), so we don't need another copy.
--with-pci-ids isn't recognised by configure, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 9a66a4e..56ced66 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -61,7 +61,6 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --disable-manpages \
                  --disable-coredump \
                  --disable-introspection \
-                 --with-pci-ids-path=/usr/share/misc \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
@@ -187,7 +186,7 @@ FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-extraconf usbutils-ids pciutils-ids"
+RRECOMMENDS_udev += "udev-extraconf"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${base_libdir}/systemd/systemd-udevd \
-- 
1.7.10.4



