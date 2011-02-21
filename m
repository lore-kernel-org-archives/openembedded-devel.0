Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PrZxk-0001cD-OJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 18:54:20 +0100
Received: by fxm8 with SMTP id 8so1712356fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 09:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=BdewfcXNbpPFpsi6IFWEdPZoykQPUJBzS5VtXkjjG48=;
	b=pS1Wxa5AT6Ww2pPnHA3jp/hh77wSnZuU1pBXtLXMSftCGvrUEUGshUomiyroBnOYqP
	6BzNPvGCgfJW6MZ5zc3+p8nFSdTLKJhLNf2vwMUVJZqJ8HRW5tHaZ2Vdgrhk4NtqRj7C
	dbI6Dv2JY2w3RHeQ5BhBg71ChzbeMkJuPS/QQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=RCeBdNYyGsAj4IN61LRQdeRCdDfneDZ+VDtgWKXxE/abXW8cNODtXx9V+zk8FkgAiy
	KqlsRRf7D5HEdTU4FbNevtGYns/5mPbZGnvqOH/0X6GBfQ26zFXpFnykcAkStu0HJS+A
	SHMDwyC6BDfa6D4lpyBMQEkmV8O16aYwp5YSU=
MIME-Version: 1.0
Received: by 10.223.86.80 with SMTP id r16mr2153130fal.81.1298310783050; Mon,
	21 Feb 2011 09:53:03 -0800 (PST)
Received: by 10.223.108.83 with HTTP; Mon, 21 Feb 2011 09:53:03 -0800 (PST)
Date: Mon, 21 Feb 2011 18:53:03 +0100
Message-ID: <AANLkTi=rTuT81+QVpNo4oL_J53nKbs5tnEh+=asqgE6a@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: minimal-image starts dragging in GTK
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
X-List-Received-Date: Mon, 21 Feb 2011 17:54:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,


since recently, minimal-image starts dragging in GTK. I have tracked
it down to this commit:

avahi: integrate python into main recipe
* this doesn't introduce spurious rdepends like enabling gtk did in the past

Signed-off-by: Koen Kooi <koen@openembedded.org>

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=70e46e545095a2b2dac634d484eb1c331a1bff34


This seems a hard-dependency, indepent of "+AVAHI_GTK ?= "-disable-gtk""

+RDEPENDS_avahi-discover = "python-avahi python-pygtk"


Is that intended?

Regards,
-- 
Leon


