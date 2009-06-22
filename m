Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1MIjc9-0003Ge-4R
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 15:31:13 +0200
Received: by bwz19 with SMTP id 19so1119094bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HjkVEm0rgQAIo7+a9BE7WRbo8JAha11jGHaGdx22RnM=;
	b=J5CguT7WBPq4GtOXieTf0+he5uHKVckQanLzo36sgCEwAqKnmv8vlCFjfJqsIQ6yaN
	iHV2E1Gt23U0gieCUWpRO4YbQKLgWDSF/zCk+sKQpWpYfQvTTYjNbby7gqzLnuO/l4oj
	zO8j+qufHNikouJ6L+/OKMwJtKlAu680RgDvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Fz+B1Pj+Ry8LsPBLpMb+9KA3OB+mdlTYgm0Hx0UxDSUwjg8Wn7tLHD0sBfkq2Kuthk
	7RjPqRswVRlnKGtjbPKGePEUTOHXrBXOTLdFWcKWMb1JNyIX1OyusQ5DOxIL9xY4fH2Y
	mp1YO+JLNTk8kzaG09628CCNRIseHMbQuLr/k=
MIME-Version: 1.0
Received: by 10.204.72.129 with SMTP id m1mr6279190bkj.61.1245676813426; Mon, 
	22 Jun 2009 06:20:13 -0700 (PDT)
In-Reply-To: <gqicrn$lmd$1@ger.gmane.org>
References: <5c5e5c350903270322o7d0ded99k3a050586bfcef19a@mail.gmail.com>
	<gqiaef$dms$1@ger.gmane.org>
	<5c5e5c350903270406u79e73e71hb8092bd4e71d088d@mail.gmail.com>
	<gqicrn$lmd$1@ger.gmane.org>
Date: Mon, 22 Jun 2009 15:20:13 +0200
Message-ID: <5c5e5c350906220620w3d09559ue22e7c373d9f1bc4@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: xmms-tremor source file is no longer available
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
X-List-Received-Date: Mon, 22 Jun 2009 13:31:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I've found this email in my backlog

On Fri, Mar 27, 2009 at 1:21 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 27-03-09 12:06, Elena of Valhalla wrote:
>> On Fri, Mar 27, 2009 at 11:40 AM, Koen Kooi<k.kooi@student.utwente.nl> =
=A0wrote:
>>> Why isn't it fetching it from the angstrom source mirror?
>> probably because of a proxy misconfiguration on my side, I'll check that=
, thanks
> I've heard of people having problems with OE not trying (or succeeding) t=
o use the source mirrors, and I'm curious what the problem is. The SRC_URI =
usually gets fixed to quickly so people aren't debugging mirroring problems=
 :(

the problem was found out to be a local proxy that returns a web page
with some "user friendly" text instead of a 404: wget is tricked in
downloading it and bitbake doesn't know it should go on trying to
fetch the package from a mirror.

I'm working around this with manual downloads, since it's not
happening very often

I wonder if trying again the download from another source after a
checksum failure would be helpful or just lead to worse problems

--
Elena ``of Valhalla''

homepage: http://www.trueelena.org
email: elena.valhalla@gmail.com


