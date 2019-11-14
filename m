Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 782767F9B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id z19so7475377wmk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fZ3hkjby0Qk8uJGsXxJ0+LJNUQeZKTussiZRAMoUzb0=;
	b=MFMfAXMQQCzcozXUQ6mlaiSn/6UxbPbcaub1Jtu6R43fnWQJasIoyJ9TFPyWJAzhZR
	GPgOENU/q8Xk6iRlLX+TbKm/vjWCRyQLpuXy4GoL8+0ar2AAhMHa6F3iaiMujgBHkPvN
	uxbXsaX+zpMF4Ze8+Gktq/9owuBnKv9DAEWjg4GvV68O9SdPiq6m11XDhb5r0doIzIqx
	BGdQ/CZGoy1HxbsKISDMOutjtlZ9bFm4IVBYPGkxr5ACokIoHe+6wcIPn7zN1P/xKjQ/
	ZYkM4uJoAWVWrzi/DJ1zfe61nMs21RhsH6IRhPBy631ymxlcAqh0P3Xn7vHCpMPZMNXq
	lvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fZ3hkjby0Qk8uJGsXxJ0+LJNUQeZKTussiZRAMoUzb0=;
	b=jNeaOP09UT8hnX3D9nfA8ZAJjH8idwJsynXi8+Zx0lUv1/AjmCsG4guHVTFIvrKUEf
	UWejnMEf5qg3VTIpqa1z7OX3EcgjP++eo4bA5tGgEnjJGwNskRWLgT0SQqJ4gX1+0k2G
	ZadrzYqCcgxx61udvyvE6thXnfDzCOJc2AFags+rG7c/J01niTC33Tg26BlJxZWe7EPu
	YCDJhkLBi2DcONkvQ6o+iFUkGrUfCT8+gHDfR26DWHN6bRCJ2qM0Sv02mAviz0uyCiAd
	L3xupSQze0pUQEA6QcfC9ZBNlmt0mQuh7VwwvqW7H+rym9bVEtWWxRJel7oN0Er3oxgj
	WI2A==
X-Gm-Message-State: APjAAAXr5fWfYy0BUpfpL70xNJho+ktzUPVlFdIUPVi61BzgZUIgPJe+
	9M3sn8yByzOsCWGGXcaSXBil8tSB
X-Google-Smtp-Source: APXvYqwX/PJQ6yARwsgAm/0a7HBrGy15WH617hsZzCdVTXhHC6kg57ND3qJL4Cad2cKkgtiWRMGiWg==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr9277085wmj.32.1573760981965;
	Thu, 14 Nov 2019 11:49:41 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:17 +0100
Message-Id: <20191114194930.2786-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/16] evolution-data-server: give up fine grained -dev/-dbg packages
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is common practice to create only one -dev/-dbg package

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../eds/evolution-data-server_3.32.4.bb       | 42 -------------------
 1 file changed, 42 deletions(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 429dd53d8..b4174cbb0 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -82,74 +82,32 @@ FILES_${PN} =+ "${systemd_user_unitdir} \
                 ${datadir}/evolution-data-server-*/ui/"
 RDEPENDS_${PN} += "perl"
 
-FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
-FILES_${PN}-dbg =+ "${libdir}/evolution-data-server*/camel-providers/.debug \
-                    ${libdir}/evolution-data-server*/calendar-backends/.debug \
-                    ${libdir}/evolution-data-server*/addressbook-backends/.debug \
-                    ${libdir}/evolution-data-server*/extensions/.debug/"
-
-RRECOMMENDS_${PN}-dev += "libecal-dev libebook-dev"
-
 FILES_libcamel = "${libdir}/libcamel-*.so.* \
                   ${libdir}/libcamel-provider-*.so.* \
                   ${libdir}/girepository-*/Camel-*.typelib \
                   ${libdir}/evolution-data-server*/camel-providers/*.so \
                   ${libdir}/evolution-data-server*/camel-providers/*.urls"
-FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
-                      ${libdir}/pkgconfig/camel*pc \
-                      ${includedir}/evolution-data-server*/camel \
-                      ${datadir}/vala/vapi/camel-* \
-                      ${datadir}/gir-*/Camel-*.gir"
-
 FILES_libebook = "${libdir}/libebook-*.so.* \
                   ${libdir}/girepository-*/EBook-*.typelib"
-FILES_libebook-dev = "${libdir}/libebook-*.so \
-                      ${libdir}/pkgconfig/libebook-*.pc \
-                      ${datadir}/gir-*/EBook-*.gir \
-                      ${datadir}/vala/vapi/libebook-*.* \
-                      ${includedir}/evolution-data-server*/libebook/*.h"
 RRECOMMENDS_libebook = "libedata-book"
 
 FILES_libebook-contacts = "${libdir}/libebook-contacts-*.so.* \
                            ${libdir}/girepository-*/EBookContacts-*.typelib"
-FILES_libebook-contacts-dev = "${libdir}/libebook-contacts-*.so \
-                               ${libdir}/pkgconfig/libebook-contacts-*.pc \
-                               ${datadir}/gir-*/EBookContacts-*.gir \
-                               ${datadir}/vala/vapi/libebook-contacts-* \
-                               ${includedir}/evolution-data-server*/libebook-contacts/*.h"
 
 FILES_libecal = "${libdir}/libecal-*.so.*"
-FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
-                     ${includedir}/evolution-data-server*/libecal/*.h \
-                     ${includedir}/evolution-data-server*/libical/*.h"
 RRECOMMENDS_libecal = "libedata-cal tzdata"
 
 FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
                        ${datadir}/dbus-1/services/*.AddressBook.service \
                        ${libdir}/libedata-book-*.so.* \
                        ${libdir}/evolution-data-server-*/extensions/libebook*.so"
-FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
-                           ${libdir}/pkgconfig/libedata-book-*.pc \
-                           ${includedir}/evolution-data-server-*/libedata-book"
 
 FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
                       ${datadir}/dbus-1/services/*.Calendar.service \
                       ${libdir}/libedata-cal-*.so.* \
                       ${libdir}/evolution-data-server-*/extensions/libecal*.so"
-FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
-                          ${libdir}/pkgconfig/libedata-cal-*.pc \
-                          ${includedir}/evolution-data-server-*/libedata-cal"
 
 FILES_libedataserver = "${libdir}/libedataserver-*.so.* \
                         ${libdir}/girepository-*/EDataServer-*.typelib"
-FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
-                            ${libdir}/pkgconfig/libedataserver-*.pc \
-                            ${datadir}/vala/vapi/libedataserver-* \
-                            ${includedir}/evolution-data-server-*/libedataserver/*.h"
 
 FILES_libedataserverui = "${libdir}/libedataserverui-*.so.*"
-FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
-                              ${libdir}/pkgconfig/libedataserverui-*.pc \
-                              ${datadir}/gir-*/EDataServerUI-*.gir \
-                              ${datadir}/vala/vapi/libedataserverui-* \
-                              ${includedir}/evolution-data-server-*/libedataserverui/*.h"
-- 
2.21.0


