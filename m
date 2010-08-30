Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Oq58k-00051m-K1
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 16:15:14 +0200
Received: from [123.192.162.165] (123-192-162-165.dynamic.kbronet.com.tw
	[123.192.162.165])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id CE3D81B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 14:05:44 +0000 (UTC)
Message-ID: <4C7BBA85.8040101@selfish.org>
Date: Mon, 30 Aug 2010 22:04:53 +0800
From: Holger Freyther <zecke@selfish.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikCe=1MNhEuYTG2Wusn1Fk43k-_7VTqaf6geFuT@mail.gmail.com>
In-Reply-To: <AANLkTikCe=1MNhEuYTG2Wusn1Fk43k-_7VTqaf6geFuT@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: a recipe for qt4-plugin-phonon-backend-vlc
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
X-List-Received-Date: Mon, 30 Aug 2010 14:15:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 08/27/2010 08:39 PM, Sylvain Par=E9 wrote:

> automoc-native itself does not build.
> (According to OE's log automoc-native is ~ 2 years old.)


Well, pick the latest version then, /usr/include/qt4 as include is lookin=
g
bad, Q_WS_WIN is only defined when Qt was build for windows.

So in summary...
	- automoc-native probably deserves an update
	- it should use the "native" version of Qt (like qmake, uic, moc...)


