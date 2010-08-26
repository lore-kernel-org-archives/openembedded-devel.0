Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ooha4-0002Lr-PK
	for Openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 20:53:47 +0200
Received: by iwn2 with SMTP id 2so1726865iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=/TzvXm6CTpOJldoQJDxkzX7ipXiSGAluEYCemCTNh8Y=;
	b=Y2as4KK2RmOrYqkZ1FmgVww8PaP9dvPhYMco1vTZffeiO5PXihSWhfrDus9ODm0xlg
	249b1h7BXwU4hAeqjqcSPN1hAF4Gk+2jcomsE+Ty5JAvN8t6JXYwvUZDP7wI2f1fP14U
	/WBVmeMUYh/P/VtpyDRdQfEKqh+Ktf5v3QvyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=lWJXReEgUtS+i8b5Ngx1hpqd1t2jt4DJ2vuVW7DNZKE0O0+Xto2mZAKPrcGugwQJqR
	u0HRABNkfoj6iNKgScp3876GjdeSxGoMra38QRzoOvv1PDQ1WeVybZGAiFskGKLn+0MC
	EY+73R0HcCXf4KCPFXHKCzb6PjHXu/QgaWkJk=
Received: by 10.231.79.77 with SMTP id o13mr12508051ibk.36.1282848793212; Thu,
	26 Aug 2010 11:53:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Thu, 26 Aug 2010 11:52:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Aug 2010 11:52:53 -0700
Message-ID: <AANLkTinGpZfVnPea6ZCcs+UxePXkRAkT6BDpxaNQezGU@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: hildon-lgpl in nonworking but appears in DEPENDS in recipes
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
X-List-Received-Date: Thu, 26 Aug 2010 18:54:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

hildon was moved to nonworking recipes but there are recipes which
DEPEND on this.

gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb:DEPENDS      =
"osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb:DEPENDS      =
"osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb:DEPENDS      =
"osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
libgpepimc/libgpepimc-hildon_0.5.bb:DEPENDS     = "libgpewidget-hildon
gtk+ sqlite hildon-lgpl"
maemo/hildon-status-bar_0.8.11-1.bb:DEPENDS = "hildon-lgpl libosso hildon-libs"
maemo/hildon-control-panel_0.9.1-1.2.bb:DEPENDS = "hildon-lgpl
hildon-base-lib osso-af-settings libosso hildon-libs osso-af-settings
libosso-help"
maemo/libosso-help_1.0.01.bb:DEPENDS =  "libosso hildon-lgpl
hildon-base-lib hildon-libs"
maemo/osso-application-installer_1.0.03-1.bb:DEPENDS = "hildon-lgpl
hildon-base-lib libosso hildon-libs hildon-control-panel
shared-mime-info"
tasks/task-maemo.bb:    hildon-lgpl

I am tempted to move them to nonworking as well. opinions ?

Thanks
-Khem


