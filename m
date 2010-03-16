Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dennis.yxun@gmail.com>) id 1NrSae-0005Pl-Rf
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 09:57:34 +0100
Received: by gye5 with SMTP id 5so98366gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 01:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=H2RlwJ281J4xVVvnW7DWfphfocEzGxOo01YYWqHBTSU=;
	b=GV3u68Xt7lI2SYdJWQBa1yvEwZcNtNR20KlkVn7Usz1Urz19qI1ei3UFa4+rNRBIdm
	Y9rHgik77OyK236rxN3a0LQ9dHFUFWCLLLjJVkvtb+vcku/L9XbyO3UwQ3eCj1qpxk+e
	XLk/O3elZ31zYxsFPYBCjlSEXKURgHWFAWcgA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=yFMaAgSWI9lUQfj13YlBkerwsZ6QGtqyTNByy1UtCZFyCq5ToZI/nKDzwVPrGfsROq
	KXHqrW79L3t9WvVntCVqTdNv6MGBF9DfbRcBDYEfoqwp+3LRTVNqq4Dmy2CE9ufTnfsO
	zRE/IY5U48LW32mEI+ivodpNSY06WlExNtNvY=
MIME-Version: 1.0
Received: by 10.101.34.4 with SMTP id m4mr1814678anj.212.1268729662098; Tue, 
	16 Mar 2010 01:54:22 -0700 (PDT)
Date: Tue, 16 Mar 2010 16:54:21 +0800
Message-ID: <7b09df4c1003160154l15891491s8461dfb3666067c3@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: dennis.yxun@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: multiple providers error
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
X-List-Received-Date: Tue, 16 Mar 2010 08:57:34 -0000
Content-Type: text/plain; charset=UTF-8

HI ALL:
      It's probably my fault, but I want to try maemo-angstrom overlay here.
So I use OE + maemo.
      Unfortunately, I hit the multiple providers problem, could someone
suggest me how to solve this.
Thank you for your patience.


[1] http://github.com/rkirti/maemo_angstrom

$ bitbake  -c fetchall maemo-angstrom-image
NOTE: Handling BitBake files: | (8216/8216) [100 %]
NOTE: Parsing finished. 7572 cached, 314 parsed, 330 skipped, 2 masked.
NOTE: Resolving any missing task queue dependencies
ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in
an attempt to select multiple providers
(['/mnt/source/maemo/maemo-unstable/maemo-angstrom/recipes/gtk+/gtk+_
2.12.12.bb',
'virtual:native:/mnt/source/maemo/maemo-unstable/openembedded/recipes/gtk+/gtk+_
2.18.6.bb']) for runtime dependecy gdk-pixbuf-loader-png
The entries resulting in this conflict were: ['PREFERRED_PROVIDER_gtk+ =
gtk+', 'PREFERRED_PROVIDER_gdk-pixbuf-csource-native = gtk+-native']
ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in
an attempt to select multiple providers
(['/mnt/source/maemo/maemo-unstable/maemo-angstrom/recipes/gtk+/gtk+_
2.12.12.bb',
'virtual:native:/mnt/source/maemo/maemo-unstable/openembedded/recipes/gtk+/gtk+_
2.18.6.bb']) for runtime dependecy gdk-pixbuf-loader-xpm
The entries resulting in this conflict were: ['PREFERRED_PROVIDER_gtk+ =
gtk+', 'PREFERRED_PROVIDER_gdk-pixbuf-csource-native = gtk+-native']
ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in
an attempt to select multiple providers
(['/mnt/source/maemo/maemo-unstable/maemo-angstrom/recipes/gtk+/gtk+_
2.12.12.bb',
'virtual:native:/mnt/source/maemo/maemo-unstable/openembedded/recipes/gtk+/gtk+_
2.18.6.bb']) for runtime dependecy gdk-pixbuf-loader-jpeg
The entries resulting in this conflict were: ['PREFERRED_PROVIDER_gtk+ =
gtk+', 'PREFERRED_PROVIDER_gdk-pixbuf-csource-native = gtk+-native']

