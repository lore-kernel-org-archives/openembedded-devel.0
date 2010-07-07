Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1OWQAc-0006Dm-O5
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 10:39:55 +0200
Received: by gxk1 with SMTP id 1so3773376gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 01:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=D/VKz3xUzjd7FntpMhzHgY370b7b1ymHUqDtsUDdXBs=;
	b=mh+4ZkEl2fuG033jSnJ2q09+ZyXkdCmUEHDyUfBGvFZaPI/cYo5xYG+6ASeIy0gkus
	u4qhlnaJX91lOKBQamNdC1KrbgoKIjxHomGbfsvI9c6F+QPdz/u1F3hZUrCuPzCB9w5o
	iy1RDPQ++ppwiali0+Pcc/BKtH8eHSs2CUsFE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=svh08/gSH9JpT+pRCLzQNlDagtK/4diodhX/39RFwnDVOynZ+BTe9tfJGj3yzMZVZZ
	61ZnHei7tbx7b8E6J347gT/k6Snzwo5lPP7yqvR6nYIshsoZx3MScnhvxHUg8AuhtBoV
	9a3G9ne2JE8nia8LLsM31VViQsfXDhAVSvcpc=
MIME-Version: 1.0
Received: by 10.90.50.19 with SMTP id x19mr5869571agx.40.1278491703220; Wed, 
	07 Jul 2010 01:35:03 -0700 (PDT)
Received: by 10.150.216.16 with HTTP; Wed, 7 Jul 2010 01:35:03 -0700 (PDT)
In-Reply-To: <loom.20100707T014705-193@post.gmane.org>
References: <1278458982-3362-1-git-send-email-raj.khem@gmail.com>
	<loom.20100707T014705-193@post.gmane.org>
Date: Wed, 7 Jul 2010 10:35:03 +0200
Message-ID: <AANLkTikgO3KV1-2kB0RWicLNuEyaAJ_IHY9TPzEl4R2C@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] base.bbclass: re-add backward compatibility with bitbake w.r.t decodeurl fix in bitbake
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
X-List-Received-Date: Wed, 07 Jul 2010 08:39:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Works for me. I'm also using bitbake 1.8.18

Regards and thanks,

Jan

On Wed, Jul 7, 2010 at 1:48 AM, Samuel Sieb <samuel@sieb.net> wrote:
> Khem Raj <raj.khem <at> gmail.com> writes:
>
>>
>> This patch seems to work with both bitbakes
>>
>> Signed-off-by: Khem Raj <raj.khem <at> gmail.com>
>> ---
>> =A0classes/base.bbclass | =A0 15 +++++++++++++--
>> =A01 files changed, 13 insertions(+), 2 deletions(-)
>>
>
> This patch works for me using bitbake 1.8.18.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


