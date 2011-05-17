Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QMS1V-000602-Fi
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:41:49 +0200
Received: by qyk35 with SMTP id 35so2890433qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 14:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=mId40SIEVTFVPYBpneCrQGkq731lFbNDOidSdB+6HeA=;
	b=R1duNIiFu+KwOdWfjkd9wpeYyaaaNXZsZukiqgpUxQXSJ6/NXMHx4gd7sOGzd84O5f
	mTYM2CHto+3VMYDqjKN0op1A7HZXcIS/M/lp5Qd9mP9gZ5CzTcZBH1ullJWOg+E/bA6R
	AJXOzY8YWpr9d1DkeKgjniy3sTiiUxlSaq+2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=VpvCsmo9P8GOSAh5enkvGTo2cvPC4YrinLTMscbn+FPN30iisFeRRAOQM1CXyOjbs7
	Ba1KDyv3l+QWmB9fSkxubyRrWEHKHwRh2Iu1fAhNjDayB/EXijJJYQz2HHu+TYJ0c8fH
	QJOthKaVxM8BETEAuWrz9tyLKOrJEt+crwTVI=
Received: by 10.229.181.142 with SMTP id by14mr847779qcb.247.1305668335209;
	Tue, 17 May 2011 14:38:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.192.13 with HTTP; Tue, 17 May 2011 14:38:35 -0700 (PDT)
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 17 May 2011 23:38:35 +0200
Message-ID: <BANLkTi=sn5n-gdOOFgt6k=PswZHhCe0Mww@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: vlc failed to build here ( palmpre2, SHR ) -fPIC thing
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
X-List-Received-Date: Tue, 17 May 2011 21:41:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I have refreesh my build here so I tried again to build VLC for my palm pre2
but It does not succeed here :

libliveMedia.a: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can
not be used when making a shared object; recompile with -fPIC
|
/home/sylvain/dev/SHR-Build/shr-unstable/tmp/sysroots/armv7a-oe-linux-gnueabi/usr/lib/libliveMedia.a:
could not read symbols: Bad value
| collect2: ld returned 1 exit status

long version http://pastebin.com/Cvd6pnuj

I have tried several ways to pass -fPIC argument to live555 recipe but
without any success..

Does some one has a clue ?

Thanks by advance.

Regards,

Sylvain

