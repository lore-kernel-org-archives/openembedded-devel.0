Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PsEky-0002Q8-9F
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:27:52 +0100
Received: by qyk35 with SMTP id 35so2978635qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=px6o6yUqQHXMUERPYNhjLWiM/+BgOIXP1crII7UoyjM=;
	b=V1/JYBY3LHGGEqIeSAwnrnYMhTXHqO9RkFtjtZU6IbXDlX2pwz4qXhoqTWdhxyo+cP
	nkPNKOJIQJIrC/nDLPkU/1l0nxe10y3zisfv4LnGHO7vZdqCNI4OibhbsxFzCDQAmQ1V
	kelRRydHICM/zzWFGPYkUWNqt9lDm5mn4cuuo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LtKYWnpZnKghk3yhqfHi6uQ6dZrgQzwqZe9ghpNq34wVuBfY5zzImAhk0fFxFA/nL0
	UmpxPUU4nEGByYAgZPtz5EY+QYrWxxdSYEdFrh3waqhRSra6n2uU4IdIO4FLbIJYo7g/
	nbT7pOH1i+W/tZQu9gOS2CsW1683M+q4pQZKs=
MIME-Version: 1.0
Received: by 10.229.78.160 with SMTP id l32mr2371942qck.298.1298467591990;
	Wed, 23 Feb 2011 05:26:31 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Wed, 23 Feb 2011 05:26:31 -0800 (PST)
In-Reply-To: <4D64CAC1.8050100@eukrea.com>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>
	<ik29om$8m7$1@dough.gmane.org>
	<AANLkTimvzFij9bx0J8PbaWv1+_9TG4p4+vHPQH2DZnvV@mail.gmail.com>
	<4D64CAC1.8050100@eukrea.com>
Date: Wed, 23 Feb 2011 14:26:31 +0100
Message-ID: <AANLkTi=2a4s-CfSktJ8P3MHSSg78ZU0CrFYqK+YuxiKq@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Wed, 23 Feb 2011 13:27:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/23/11, Eric Benard <eric@eukrea.com> wrote:
> As already said before, there is an other version of this recipe in
> recipes/firmwares/linux-firmware.inc
> which is already splitted in small packages for some firmware such as :
> firmware-atheros-ar9271.bb
> firmware-marvell-sd8688_10.38.1-p25.bb

So you suggest removing recipes/linux-firmware altogether?
If so, recipes/firmwares/linux-firmware.inc would need a lot of
reshaping to provide what I need (bus specific packages).

bye,
Filip Zyzniewski


