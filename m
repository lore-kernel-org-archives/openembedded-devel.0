Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZ23w-0003ox-VI
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 15:31:52 +0200
Received: by bwz10 with SMTP id 10so4644941bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tQ5U0VNHhMS/xHXHFY4VcPE0A3oL8fYDIjQiWl7y4Mg=;
	b=sbelFtFf0YqzVhnByMl+UYpZgAHW7XmAm2S6QDop5OH7iIKMVp8iBWeB1T0dRDf+Zw
	Grdl2laoFW77fV6Zhx/B6hdKNQ0Kiy31I9/dJXajbYsQgeT+416nGcbjHYN6jMTKxBqY
	qR9EFYHsU9XW00881Ma39qYNF/yDakM3JbMpw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e1+rH1RR4/7c0ahVoLGFCBTg9cydOV8E09/ffSXB0unjzU5+Cmo2jk/157d1Ys8ci7
	cRzn5wQNDUUaDJKL95ug9PJOCCNEtMf+0U64iSek9IiJiszspVAGIl5tyV9JCSVBxXFw
	PYPNaKmDqmbbJ3nM24+WWhSPbMwvDzP4vAOFE=
MIME-Version: 1.0
Received: by 10.204.84.92 with SMTP id i28mr614187bkl.57.1279114307461; Wed, 
	14 Jul 2010 06:31:47 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 06:31:47 -0700 (PDT)
In-Reply-To: <4C3DBB0A.6070907@balister.org>
References: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
	<AANLkTikVmldXgiiXObLbE5sPWAvFsfEqCuQZZzzmazBw@mail.gmail.com>
	<4C3DBB0A.6070907@balister.org>
Date: Wed, 14 Jul 2010 15:31:47 +0200
Message-ID: <AANLkTik7rLr7494e76lVSraKV59TKBL8vb6JeqWUPQE-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/3 v2] xilinx-virtex4: new file
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
X-List-Received-Date: Wed, 14 Jul 2010 13:31:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/14 Philip Balister <philip@balister.org>

> On 07/14/2010 03:15 AM, Frans Meulenbroeks wrote:
>
> ....
>
>  2010/7/14 Adrian Alonso<aalonso00@gmail.com>
>>
>>> +# Device nodes add xsa for (system ace)
>>> +IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
>>> +                       files/device_table_add-xsa.txt"
>>>
>>>
>> I think these are normally not put in machine files.
>> (at least I normally put them in my image recipe's not in the machine
>> file).
>>
>
> Just out of curiousity, what are these files for?
>
> Philip
>
> They are tables to make a static /dev
Very useful if you are running a resource contrained (aka embedded :-) )
setup in a static configuration, as you do not have to run udev or friends
(ofc you cannot really have hot pluggable devices).

Frans

