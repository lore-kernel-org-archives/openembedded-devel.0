Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MkJa6-0006cs-Lq
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 17:23:06 +0200
Received: from tamarin.localnet (unknown [211.48.194.125])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3C9E21B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 15:09:14 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 6 Sep 2009 17:03:48 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <4AA3ABA8.304@eukrea.com>
In-Reply-To: <4AA3ABA8.304@eukrea.com>
MIME-Version: 1.0
Message-Id: <200909061703.48206.holger+oe@freyther.de>
Subject: Re: qt4-embedded & tslib
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
X-List-Received-Date: Sun, 06 Sep 2009 15:23:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 06 September 2009 14:31:36 Eric B=E9nard wrote:
> Hi,
>
> in order to get gt4-embedded working with tslib, I had to do the
> following change.
> Without this, tslib loads properly the module_raw (input in my case) but
> none of the module (pthres, linear & co) defined in ts.conf (despite the
> fact ts_test & co are running fine).

Please google for the QWS_MOUSE_PROTO environement variable... tslib suppor=
t=20
is built as a plugin and Qt needs to be instructed to load it.

regards
	z.



PS: http://qt.nokia.com/doc/4.5/qt-embedded-envvars.html


