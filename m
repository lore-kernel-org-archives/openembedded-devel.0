Received: from mail-qy0-f196.google.com ([209.85.221.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1Nply7-0005Yf-4V
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 18:14:47 +0100
Received: by qyk34 with SMTP id 34so256294qyk.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 09:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+3qVDRczpnj5/6e3cuUVjKoRUvID2CFar3e429RYiQo=;
	b=kzrodtL7ZlVy/0xlEsfESbb04SlPzXon5YwZAraoye9JFH31Om0p7MR0+Ohpxxl5e8
	WjULq2vnidu2w/aSMCjDAZPkoRcxbnzZ7s1lGFQ8zfFbWoSY8DynAbgQyN+wQgHLRzsz
	iBImRI0oZtNm75tEOhbnGXdUK8tpf9FNScprk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ugBqJjuLFvtiwJjL59OhyP/v1z/Aoc45YqqTYPU4WN2IvTb4I/Jagr35aSWzc1xrZw
	6HPni7wuNFdKVySwQ4cf3T1DdNrXnTvnMFvLZByadwihftesz3ox0wu15AYv8VFWkb36
	S8m3pzo1esSmLgGNZ2YiyUx8oCXvmRWh21fhU=
MIME-Version: 1.0
Received: by 10.229.226.1 with SMTP id iu1mr717200qcb.19.1268327503578; Thu, 
	11 Mar 2010 09:11:43 -0800 (PST)
In-Reply-To: <1268310656.14566.1084.camel@mill.internal.reciva.com>
References: <738913.90211.qm@web88207.mail.re2.yahoo.com>
	<1268310656.14566.1084.camel@mill.internal.reciva.com>
Date: Thu, 11 Mar 2010 09:11:43 -0800
Message-ID: <5e088bd91003110911y28d4c2femcfb89d9ec5e08714@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.196
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Thu, 11 Mar 2010 17:14:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2010 at 4:30 AM, Phil Blundell <philb@gnu.org> wrote:
> I've managed to reproduce this problem now, and I have checked in an
> extra patch (as well as the previous ones) which fixes it for me. =A0Does
> that work for you?

Once I worked past some scsi header issues that crept in from this
morning's pull I could successfully build gtk+ again.  Thanks!

Steve


> p.
>
> On Wed, 2010-03-10 at 15:53 -0800, JOSEPH KORTJE wrote:
>> Hi Phil and Steve:
>>
>> If we *either* install
>>
>> sudo apt-get install libgtk2.0-dev
>>
>> or if we do
>>
>> bitbake gdk-pixbuf-csource-native
>>
>> FIRST
>>
>>
>> Then the
>>
>> =A0 =A0 bitbake gtk+
>>
>> succeeds.
>>
>> Otherwise, with the same tree used by Steve, same results as Steve menti=
ons.
>>
>> Any ideas why?
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


