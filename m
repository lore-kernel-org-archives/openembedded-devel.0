Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Omh1q-0000Sk-AH
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 07:54:07 +0200
Received: by qyk4 with SMTP id 4so4191176qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 22:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iwgzbmKL21bGtdVj9tdm7c3SI584gSlbexsWrVxql7A=;
	b=DCXnk7Qc+HEb8FxSFgwReMWUy1j1Xo3+GT3xxYqG3Hb5bDfS2m/gQIj7JcQcSegbFX
	F4jdaYjQleF83Ec+QPtNOvx0pcLtvgz8y4r5Ut1Jr8KlvLBKalPi17S7l5WWHnI3hMaQ
	En63Ndqcw/1dDmwRcW1hJWAcl5YARfPx0x3fQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jtUK9iTEgZoHVMIyQYx7YX3GtbzcVFZFSBiOPoZ+Cfgu8Hcq+WqeZsdxL+5bj0YZpP
	3/sL5pUTbkdTejvqTTI7y+Tps10sSFQRsIAETsuak6g3cnhSzsfoW01f3/iPODJ4IyHv
	+szKoyFhqJx4cU40PW+kbynitbJi4aew+cd7E=
MIME-Version: 1.0
Received: by 10.229.215.67 with SMTP id hd3mr1834633qcb.74.1282370023683; Fri,
	20 Aug 2010 22:53:43 -0700 (PDT)
Received: by 10.229.23.1 with HTTP; Fri, 20 Aug 2010 22:53:43 -0700 (PDT)
In-Reply-To: <20100820000226.GD26112@denix.org>
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
	<AANLkTinytMQ0=hav0GiqPV0S-Avo16-DDFDcEd6QWYhg@mail.gmail.com>
	<AANLkTinvou+tVwQ683OqsTrRvHJV8HdBfTJOuPiBoK5q@mail.gmail.com>
	<20100820000226.GD26112@denix.org>
Date: Sat, 21 Aug 2010 07:53:43 +0200
Message-ID: <AANLkTi=QyChsM2bquh6uGB-8jqRP8uwDrfX75qerrwGx@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev (was Re: What to do about the poor bitbake Quality Control?)
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
X-List-Received-Date: Sat, 21 Aug 2010 05:54:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 8/20/10, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Aug 18, 2010 at 07:05:48PM +0200, Frans Meulenbroeks wrote:
>> 2010/8/18 Jason Kridner <jkridner@beagleboard.org>:
>> > On Wed, Aug 18, 2010 at 11:07 AM, Cliff Brake <cliff.brake@gmail.com>
>> > wrote:
>>
>> >>
>> >> Getting started
>> >> (http://wiki.openembedded.net/index.php/Getting_started) points to a
>> >> tarball for bitbake 1.8.18. =A0Is this still the recommended
>> >> version/mechanism for new users? =A0I much prefer simply pulling bitb=
ake
>> >> from git.
>> >
>> > Koen pointed me to
>> > http://gitorious.org/angstrom/angstrom-setup-scripts/blobs/master/oebb=
.sh
>> > for setting up my environment. =A0I also prefer pulling bitbake from
>> > git. =A0Koen seems to be pulling bitbake 1.10, instead of 1.8.18.
>> >
>> 1.10 is now officially released and is supposed to be better and faster.
>> I think we should change the wiki page to reflect using 1.10
>
> 1.10 is Python 2.6 based (AFAIK) and some people are not up to speed with
> that, i.e. using older distros with 2.5 or even 2.4...
>
> --
> Denys
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


