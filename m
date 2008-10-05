Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1KmaFl-0007sB-Pa
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Oct 2008 22:30:57 +0200
Received: by ey-out-1920.google.com with SMTP id 4so695464eyg.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2008 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=p/2ugeg97rWpmKZAKdEDCowCFRmlF9Tp6W6K1vbIHVc=;
	b=JhaxG8miG51BZCwQQ2J4pZZ/A6JHSqukz12Rc1CJFQHyrS7s4J3RdPsnYKR/KpS29P
	1z8Mvhtxct/IW9//mBJrxfI4XKAlqMADm46/VYkS2pe8BR9eOgbPsYz26nRk06ow0Qyo
	uOrVaBitl12d4ztkuv76EyLN0daBl4qOCZdmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=ROtFtzCHXdIM2+8RR3+W8VJ22Xtqft11SJ53HdMqAMMTuO0dK9Telq+ef4oRzcRKfN
	675UJc2pJN1DZa0ze36kafFP1U9fgEgZRSQT4RyIlxgGpx1O+zt7a7fV9rSJ05hI92D3
	+jHi9RvpcXUDcvbpPzduFEbFfN+23PlkiB4IA=
Received: by 10.210.72.14 with SMTP id u14mr5126477eba.179.1223238391478;
	Sun, 05 Oct 2008 13:26:31 -0700 (PDT)
Received: by 10.210.138.17 with HTTP; Sun, 5 Oct 2008 13:26:31 -0700 (PDT)
Message-ID: <359c5480810051326k2e921048r17f6b93e00aa619c@mail.gmail.com>
Date: Sun, 5 Oct 2008 22:26:31 +0200
From: "Nicola Mfb" <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810051937.40377.zecke@selfish.org>
MIME-Version: 1.0
References: <359c5480810050806t6e368b2fta20d1edecd165757@mail.gmail.com>
	<200810051937.40377.zecke@selfish.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Qt 4.4.1 and sqlite
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
X-List-Received-Date: Sun, 05 Oct 2008 20:30:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/10/5 Holger Freyther <zecke@selfish.org>

> On Sunday 05 October 2008 17:06:53 Nicola Mfb wrote:
> > Hi,
> > while trying to port a custom qt/application to angstrom i noted that the
> > qt sqlite driver is not available.
> > May be it possible to have support for it?
>
> sqlite2 or sqlite3? sqlite3 should always be part of Qt, and we do accept
> patches too.
>

I mean sqlite3, I simply rebuilded an applications that read all qt
available sql drivers and show a dialog tho choose one of them. This was
empty on angstrom  while on a desktop pc it usually shows sqlite and some
others drivers (mysql and pgsql).
In the file packages/qt4/qt_configuration.inc i read:

QT_CONFIG_FLAGS += "-release -no-cups -no-accessibility -reduce-relocations
\
                    -shared -no-nas-sound -no-sm -no-nis \
                    -qt-gif -system-libjpeg -system-libpng -system-zlib \
                     -no-sql-ibase -no-sql-mysql -no-sql-odbc -no-sql-psql
-no-sql-sqlite -no-sql-sqlite2 \
                    -no-pch -qdbus -stl -glib"

So -no-sql-sqlite should be modified in qt-sql-sqlite (linked into the
library) or plugin-sql-sqlite (build as plugin). I'm not sure if the second
option loads the plugin only when needed or is a simple way to support
external plugins in qt.

I hope tomorrow I will be able to test a qt rebuild, and reports some
feedback here.

Regards

    Nicola

