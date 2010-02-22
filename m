Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <majo.huber@googlemail.com>) id 1NjWHI-0003m8-2N
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 12:16:43 +0100
Received: by ewy4 with SMTP id 4so1162749ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 03:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=k/sAUYNyZiN35qW4hi+Usoy2pfZXq0UrvSqcg1+3uN4=;
	b=ShPQv+yJJnbW0oJ/DwbiVGJN4HISAcrKxDh32rn7Uyc2/Xiq81TQndAIjSCjGyMqud
	dtVUPw8DHG0HPZtg0HYoqFzXMOVtvj46QsI0QNIJE5Mv55uWTZf0FzxvSMLbD0n9uScT
	WyUMfB9cMyprKnGZ4PUwy+UdNP+QGw694XGzs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SFQkw/gWzLyFnBSjmec/2ty65H9oBIhPc7Tcgi2CTpZopOCxAyNnKQr2FSymzP4o1p
	6FFwxLzsTqzGwMNd6ZZxXx6MCndNb9i47GTBXqEVIODQD+1xk9injtmH1oi65LX389kd
	DRM6J835Wr0XdlInfcKTsz5jpIMrG9QE+Z1ZA=
MIME-Version: 1.0
Received: by 10.216.86.67 with SMTP id v45mr1842810wee.70.1266837235652; Mon, 
	22 Feb 2010 03:13:55 -0800 (PST)
Date: Mon, 22 Feb 2010 12:13:55 +0100
Message-ID: <40d782961002220313y7f90001fmb35315559a7de999@mail.gmail.com>
From: majo huber <majo.huber@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: majo.huber@googlemail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: omniorb libs are not striped in new recipie
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
X-List-Received-Date: Mon, 22 Feb 2010 11:16:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi@all,

we have written a new recipie for a newer version (4.1.4) of omniorb
than the current one in the openembedded repository (4.0.7).
Everything works well but the striping of the libs in the normal
omniorbxxx.ipk package. The libs in the normal omniorbxxx.ipk (not
-dbg) package are not being striped but the binaries (in /usr/bin).
That's not what we want...
Notice: We added the macro m4_pattern_allow(PKG_CONFIG_LIBDIR) to
configure.ac, since there were an error saying that this should be
done.
Could anybody give us a hint, please?

Thanks in advance,
majo


