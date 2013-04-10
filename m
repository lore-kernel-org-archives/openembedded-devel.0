Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec13@gmail.com>) id 1UPv6V-0001ti-6r
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 15:30:46 +0200
Received: by mail-ob0-f181.google.com with SMTP id wo10so378509obc.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type; bh=cyB/tEEE13cWROCRf0JrtsOwTRezN+0I2WdSU+d5Rdk=;
	b=lC3+LOunVlGpLTZxMbfhD3cAs+/U0rhz9hKB6JMYubXILfEbL+E39HcZ1qMPDlZ0sd
	gXNvoVomMsbPNu2goEH7McAhsyGSyIe4ZKvgYeQ5G61KN1zSMTATpsQHUsPT5wXp2/ux
	GwRy76RVW9bN0KRGixF4fBq6yT+fkmo6d0W7bnchCP6nxhnZD3XCSMDTEON7zeVRcdCT
	BIMXVUDOqqYI+Wzqau4hVApvxwgXKbCGdRIoU+cirJCgmnvm7dga+jKdhLsn+V2CoKJ3
	AN7riTPOn2KFVUOCv/lGjK1LVOYJzpqm2puiZQCAqXKRWD/bIbPK2hZ8MMSk4pYDIFN6
	1CEg==
X-Received: by 10.182.237.50 with SMTP id uz18mr715049obc.51.1365599581285;
	Wed, 10 Apr 2013 06:13:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.34.39 with HTTP; Wed, 10 Apr 2013 06:12:41 -0700 (PDT)
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 10 Apr 2013 15:12:41 +0200
Message-ID: <CAOT3miKm12uZ75LrH5fvRxrSvZ7wbyi+ioxMQgROsF3B-mJTvQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: why does gupnp depends on gnome-icon-theme?
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
X-List-Received-Date: Wed, 10 Apr 2013 13:30:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi there,

i have noticed that gupnp (in meta-multimedia/recipes-connectivity)
depends on gnome-icon-theme, and I don't really understand why, see

http://cgit.openembedded.org/meta-openembedded/tree/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc#n5

i was able to build an image with gupnp even after patching DEPENDS to
get rid of the dependency, and the main concern with this dependency
is that it brings:

RRECOMMENDS_${PN} = "librsvg-gtk"
and as such attempts to build gtk+, while I am trying to make a
directfb image without GTK.

so, is there any specific reason why there is such a dependency?

thanks!

nicolas


