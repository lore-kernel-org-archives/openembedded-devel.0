Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxbGj-0004B2-CU
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 09:58:34 +0200
Received: by iwn2 with SMTP id 2so4149203iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 00:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=inC6cn7dPbZUK4/1amyBs6u6dujQjiB8e/+ldZRzVXU=;
	b=pAaBmSW0510BvIqmgarjBFTX24jACaP3uSsK+ScJ8O2nNlX29pZ1658Dq3qmAYha6b
	osH9DzaeuL6tmb2V9lLbM6HT+lc2DLrIep0tA3GK6Xw0fn9O5Lov2Em7vQ8jsjUYk16v
	EeiKF8svvLuyx7Kh5igNYppPAJOk38OdPR710=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Po2bd5RLyE5tmNUyjLG8oWGqZxCTC5lG1nrK+KkupILEQF/Nd0cQpnxplw46HxcjhG
	LZqGhjGn1RBV+boKrmdXSj94FjbHf8gNPH+rQhMTTUOkjc2aSGtjXtce7pTpXXjbhmKy
	LVm59iF2UcGiJahOnAztSowqprtmPe/LqG5qw=
MIME-Version: 1.0
Received: by 10.231.169.210 with SMTP id a18mr9890048ibz.5.1284969458041; Mon,
	20 Sep 2010 00:57:38 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 00:57:37 -0700 (PDT)
In-Reply-To: <AANLkTimL2QKeoF545-Vk_f-Kch76dN5A3frF7mhMV0Cy@mail.gmail.com>
References: <1284921702-22995-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4C967589.9080501@eukrea.com>
	<AANLkTimL2QKeoF545-Vk_f-Kch76dN5A3frF7mhMV0Cy@mail.gmail.com>
Date: Mon, 20 Sep 2010 09:57:37 +0200
Message-ID: <AANLkTi=4dfbfZ+drOmgkJydVEb702XQ9yYvcEp_XbeFr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python: remove python-dev from python-modules
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
X-List-Received-Date: Mon, 20 Sep 2010 07:58:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/19 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/9/19 Eric B=E9nard <eric@eukrea.com>:
>> Hi Frans,
>>
>> Le 19/09/2010 20:41, Frans Meulenbroeks a =E9crit :
>>>
>>> python-modules has python-dv in it sdependencies.
>>> I'm not a python wiz, but I feel that is no good as it drags in a lot o=
f
>>> dev
>>> packages. Note too sure if thre should be a depends on python though.
>>>
>> please see this patch serie which waits for an ack (PR will be increased
>> after) :
>>
>> http://patchwork.openembedded.org/patch/2917/
>> http://patchwork.openembedded.org/patch/2919/
>> http://patchwork.openembedded.org/patch/2918/
>>
>> Eric
>
> Hi Eric,
>
> Your patch seems to address the same issue.
> Actually saw it before but didn't realize I was facing the same
> problem (and didn't know enough from it to ack it)
>
> Frans
>
Retracting my patch in favour of Eric's patch as it fixes the problem
at the root by patching the generator, where I only patched the
outcome of the generator.

Frans


