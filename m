Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IO8OE-0002F1-TA
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 10:50:07 +0200
Received: by fk-out-0910.google.com with SMTP id 18so405034fks
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 01:48:57 -0700 (PDT)
Received: by 10.82.190.2 with SMTP id n2mr3593478buf.1187858936792;
	Thu, 23 Aug 2007 01:48:56 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Thu, 23 Aug 2007 01:48:56 -0700 (PDT)
Message-ID: <74d0deb30708230148y75af9399m1fbff6d46948bfdf@mail.gmail.com>
Date: Thu, 23 Aug 2007 10:48:56 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: dbus-glib-native: install dbus-binding-tool to ${STAGING_BINDIR}?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2007 08:50:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, I've got this change in my local workdir, unfortunately I don't
remember what exactly needed the binding tool. Is this ok to commit?

--- packages/dbus/dbus-glib-native_0.72.bb	278c6e1074af019c5bf108638bebfba814ddc160
+++ packages/dbus/dbus-glib-native_0.72.bb	5c8a08a3c0bc93f2de4060d523738b5500cd88c0
@@ -1,5 +1,5 @@ SECTION = "base"
 SECTION = "base"
-PR = "r0"
+PR = "r1"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 DESCRIPTION = "message bus system for applications to talk to one another"
 LICENSE = "GPL"
@@ -19,4 +19,5 @@ do_stage() {
         install -d ${STAGING_DATADIR}/dbus
         install -m 0644 tools/dbus-bus-introspect.xml ${STAGING_DATADIR}/dbus
         install -m 0644 tools/dbus-glib-bindings.h ${STAGING_DATADIR}/dbus
+	install -m 0755 dbus/.libs/dbus-binding-tool ${STAGING_BINDIR}/
 }

cheers
Philipp


