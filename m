Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N79A1-0001s3-VK
	for openembedded-devel@openembedded.org; Sun, 08 Nov 2009 15:54:37 +0100
Received: from castle.reciva.com ([82.71.203.193] helo=[192.168.5.63])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N795Y-0006en-S4
	for openembedded-devel@openembedded.org; Sun, 08 Nov 2009 14:49:56 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <1257689597-31831-1-git-send-email-ynezz@true.cz>
References: <1257689597-31831-1-git-send-email-ynezz@true.cz>
Date: Sun, 08 Nov 2009 14:49:54 +0000
Message-ID: <1257691795.25369.229.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libgsf: fix compile error, add missing dependency on gtk+
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
X-List-Received-Date: Sun, 08 Nov 2009 14:54:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2009-11-08 at 15:13 +0100, Petr =C5=A0tetiar wrote:
> This patch fixes this compile error:
> main.c:38:35: error: gdk-pixbuf/gdk-pixbuf.h: No such file or directory

I wonder if you might be better off depending on gdk-pixbuf rather than
the full gtk+.  Does that work for you?

p.




