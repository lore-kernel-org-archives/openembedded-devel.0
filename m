Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvQn1-0003SP-NB
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 10:22:56 +0200
Received: by iwn2 with SMTP id 2so5944724iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/JP3JcXpq8lqZbbaDqwmbjjfiHe8mmxmQ0GcK/S0VyU=;
	b=LdeLTAMUb4hGhRr30kaZIs66lL2Bqblbeg5X+PK/L6D4qFKO+60ERh5FepCsBx+8oi
	cyE9divsY7bDhukIlewa3WtvmyMsUcTp4axqBfa5S94pwM5xhup2wJmN5ilnXKA2mcxo
	/8KSBg3AVsxovd2Q1+ID53OyxPgmizQt+7wdU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Q7k+prQwov32BQe2nEjh3x81SMa0i9Yy0vBkcvWsb096CgXe1vWDw6+SUnbahleQx8
	P4gOwZa/oBQH7kB2LGcRYp+oMl+ggPe3gmtcTEBjDBlJa7ZmagH5QLmNnUcqPb660M2a
	7zHyOtztwsOwaJME8Hy/EuWl71JjRQIV3qFN8=
MIME-Version: 1.0
Received: by 10.231.33.131 with SMTP id h3mr7348348ibd.148.1284452526629; Tue,
	14 Sep 2010 01:22:06 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Tue, 14 Sep 2010 01:22:06 -0700 (PDT)
In-Reply-To: <1284450969.7160.8.camel@mattotaupa>
References: <AANLkTi=KwCAU5f6WWAqx+hQ+-XD8W_7tbFauK5O9Kv8d@mail.gmail.com>
	<1284450969.7160.8.camel@mattotaupa>
Date: Tue, 14 Sep 2010 10:22:06 +0200
Message-ID: <AANLkTinTPpGBVX5_ntXyUUH_0gz4AfzskzSpTq1vfChd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: beagleboard-demo-image fails on gnome-games
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
X-List-Received-Date: Tue, 14 Sep 2010 08:22:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/9/14 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear Frans,
>
>
> Am Dienstag, den 14.09.2010, 09:09 +0200 schrieb Frans Meulenbroeks:
>
> [=85]
>
>> | xsltproc -o aisleriot-en_GB.omf --stringparam db2omf.basename
>> aisleriot --stringparam db2omf.format 'docbook' --stringparam
>> db2omf.dtd "-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam
>> db2omf.lang en_GB --stringparam db2omf.omf_dir "/usr/share/omf"
>> --stringparam db2omf.help_dir "/usr/share/gnome/help" --stringparam
>> db2omf.omf_in "/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angst=
rom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help/a=
isleriot.omf.in"
>> =A0`/home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/bin/=
pkg-config
>> --variable db2omf gnome-doc-utils` en_GB/aisleriot.xml || { rm -f
>> "aisleriot-en_GB.omf"; exit 1; }
>> | warning: failed to load external entity
>> "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
>> | cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
>> | warning: failed to load external entity
>> "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
>> | cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
>> | warning: failed to load external entity
>> "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
>> | cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
>
> [=85]
>
> (I would prefer it if line wrapping was turned off for pasted log or
> code sections.)

If you can tell me how to do that with gmail (using the web interface)

>
> I think I had the same problem with Evince [1] and Khem fixed it for me
> in b2c2771ddc0e5ddc307999a9a63c5bade88d5956 [2]. Did it ever build for
> you? I think most people do not notice since they have this installed on
> the build system and so the file is found.

It might be that something similar to that patch is needed here.
I think it did build for me in the past on another system which
probably had the docbook stuff installed locally.
I was test-driving our new build server when I noticed this.

Frans


