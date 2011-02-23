Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickael.chazaux@gmail.com>) id 1PsAtV-0002Dz-4e
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 10:20:25 +0100
Received: by vxd7 with SMTP id 7so3224660vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 01:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Z1v1j+2W2N/MHPNJ25BQLpTTjVpniG5G+rcemA6mfwo=;
	b=Z4jom0JZYXaqx1txY6BXoO6TPCQEauqtIVyKYP7CNyaB0pzrtrkKtUtwSaLG7FjuWB
	Pin1iPyClbdUc05ZebOZj3aoiePhAKkppV91a73Tei6Q+tTvewTbKvS709EO9Z1771BF
	GI/n/g98sNRNG09cE364eZo4zQ9jLtSDGOzC4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jie8c0m5AJ2hl5ON9+ICgnTS6JR6qBlvgOoR17FsPuts4mq8QwcyscDDk+BV76FUBZ
	7BURT8Y4T6O3kamSjUULTxvZST95vBDh7j28g2ud9/3NfvILzJQ6I/u5jwhC0YOae/FD
	qefEPNbixCeh31zLTV4YbtcOY2zV7uzmNPAbE=
MIME-Version: 1.0
Received: by 10.52.157.70 with SMTP id wk6mr5620004vdb.219.1298452745078; Wed,
	23 Feb 2011 01:19:05 -0800 (PST)
Received: by 10.220.180.7 with HTTP; Wed, 23 Feb 2011 01:19:05 -0800 (PST)
In-Reply-To: <20110222201107.GB3970@localhost.jama.net>
References: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>
	<4D63F7F9.7000804@eukrea.com> <4D63FF5C.30400@opendreambox.org>
	<20110222201107.GB3970@localhost.jama.net>
Date: Wed, 23 Feb 2011 10:19:05 +0100
Message-ID: <AANLkTi=E2wEw8oCD8r8fzuD9GykdaJiz3JDehbiAR3sY@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Weird behaviour with PPP
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
X-List-Received-Date: Wed, 23 Feb 2011 09:20:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2011/2/22 Martin Jansa <martin.jansa@gmail.com>:
> On Tue, Feb 22, 2011 at 07:24:28PM +0100, Andreas Oberritter wrote:
>> Hi,
>>
>> On 02/22/2011 06:52 PM, Eric Benard wrote:
>> > On 22/02/2011 18:22, Mickael Chazaux wrote:
>> >> I have a hard time figuring out why bitbake seems to mix versions of
>> >> ppp... Any ideas?
>> >>
>> > strange, which distro, git tag, bitbake version are you using ?
>> >
>> > Both bitbake ppp-2.4.5 & bitbake -b
>> > openembedded/recipes/ppp/ppp_2.4.5.bb work fine here (angstrom 2008.1,
>> > armv5 target, bitbake 1.12.0).
>>
>> I don't think this has anything to do with ppp. I faced the same issue
>> with a local recipe, of which an older version had been built before.
>> When packaging, the old version was used. A new workdir was created for
>> the old version during this step and the resulting packages were empty.
>> No recipe existed for this old version at that time, i.e. PR had already
>> been increased to 1.0, but 0.0 was used by bitbake.
>>
>> In the end, I deleted bitbake's cache and all files matching the
>> package's name to get rid of the annoying problem. I think there were
>> pstage packages of the old version lying around.
>
> This wrong behavior is quite common ie after changing PACKAGE_ARCH, see:
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg04280.html
>
As I often switch architectures (arm, x86) to work on different
boards, should I use a different TMPDIR for each?

Regards,

Mickael


