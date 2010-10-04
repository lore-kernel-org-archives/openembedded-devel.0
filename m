Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P2sgG-00009k-DD
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 23:34:45 +0200
Received: by pwj1 with SMTP id 1so1216693pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 14:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tD7/diw94oN8oPYC18jrTqWHtryIrmTW6I54hUpnWUQ=;
	b=bfm4nZitKr5GKADNZvoKt9o7M4l24dBDVkNpDoJWW8BvjMx7ueo9oYzniFLPOMFxnS
	s1W/Ifu9sqOiFAhtE033uNt6aJ9eulo4+cVTBs0iymu6k2bEu8IYhUvuDkrDIfl2srcc
	50l+h/fFJM90gigoyWnXRBKdludRAzbwQbvLM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hejc42HgcNkzZXgQiWhdz31XzIDtQEHC8rGOGDNC/IDH9RMFcGrOsHLmQ323C5tVOf
	Q427OP1X4dlIVr3JrcVWGIc+QJ5vWkkIY/QOVwdJrcP7fUPpJ6U3zB+36pmBPqu4cjzN
	4aEu8iu55aSXZTKBFNnD+M3OYnJkRNgMox2MA=
MIME-Version: 1.0
Received: by 10.142.230.4 with SMTP id c4mr9319636wfh.53.1286228064533; Mon,
	04 Oct 2010 14:34:24 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 4 Oct 2010 14:34:24 -0700 (PDT)
In-Reply-To: <4CAA47A8.2040807@mentor.com>
References: <AANLkTi=7CfOcg=8odi3k95kbMM5qxjNfunqLnLTBxKzs@mail.gmail.com>
	<4CAA47A8.2040807@mentor.com>
Date: Mon, 4 Oct 2010 14:34:24 -0700
Message-ID: <AANLkTimz6Wo7n7tyAcMK_oG_jmUYrkQey2em+NwuV9xT@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about check data file clashes
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
X-List-Received-Date: Mon, 04 Oct 2010 21:34:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2010 at 2:31 PM, Tom Rini <tom_rini@mentor.com> wrote:
> J. L. wrote:
>>
>> I am trying to get my image to build and running into a check data
>> file clash and not sure why or how to fix. It says two packages are
>> trying to install the same file, so how do you make this get through
>> and still have both packages installed? Here is the error I got:
>>
>> | Collected errors:
>> | =A0* check_data_file_clashes: Package linux-libc-headers-dev wants to
>> install file
>> /home/vdubhack/overo-oe/tmp/rootfs/qEnlightDesktop/usr/include/scsi/scsi=
.h
>> | =A0 =A0 =A0 But that file is already provided by package =A0* libc6-de=
v
>>
>> Thanks for any help on this.
>
> Your provider of linux-libc-headers is broken and needs a fix ala the
> 2.6.31/2.6.32 recipes have.

Ok thank you I will look into it I built the image with the .34
headers so guess thats my issue. Thank you for your time.


>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


