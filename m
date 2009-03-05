Received: from [195.135.220.15] (helo=mx2.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LfACr-0001ad-44
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 10:49:35 +0100
Received: from Relay2.suse.de (relay-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 03E4A473B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2009 10:45:13 +0100 (CET)
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 993B8628082
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2009 10:45:12 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <EC5EE493B6046F45A2DDEC4A828DE52E039C63A6@EXCHSRVR.syntech.org>
References: <EC5EE493B6046F45A2DDEC4A828DE52E039C63A6@EXCHSRVR.syntech.org>
Date: Thu, 05 Mar 2009 10:45:11 +0100
Message-Id: <1236246311.607.4.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: Error building gnome-vfs-2.22.0
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
X-List-Received-Date: Thu, 05 Mar 2009 09:49:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Mark Butsch wrote in Wed 03/04 2009 at 16:59 -0500:
> Hello,
> 
> When building gnome-vfs-2.22.0, it fails task do_configure with the
> following error message:

> No package 'dbus-glib-1' found

Try this. I can imagine, that this dependency was undiscovered for a
long time, as it is pretty common.

--- a/packages/gnome/gnome-vfs_2.22.0.bb
+++ b/packages/gnome/gnome-vfs_2.22.0.bb
@@ -1,5 +1,5 @@
 LICENSE = "GPL"
-DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib"
+DEPENDS = "libxml2 gconf dbus dbus-glib bzip2 gnome-mime-data zlib"
 RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



