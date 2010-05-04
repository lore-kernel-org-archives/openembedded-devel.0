Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1O9IaD-0002pv-Es
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 15:54:52 +0200
Received: by fxm11 with SMTP id 11so3097894fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LfUGTgrQEYWZzxv1GE9f6DirBnMcVE3nXxKoFzuDNe8=;
	b=BR6dKUA6AjpAEdpul8yDx1vNnPAGLRB2qynmUQKA7cye0xeFmNKH95doU0X/c88U17
	IybFPuYuTumZvZ90ONPUU90XUlqZ6bi+bq1D9+/kpv8GUQelBxfEXuDxLPBoGuLVNPJt
	BVGC8u3WeFI7GCUxnOQdGOIyrrcb92tGOo9I0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XNNvv5xchPh5PCIhDQ0J1petJy9I+63wo+Ygqo7ju2YB1cht0OHpiph6ASg7p3I03b
	IWy0osXRWI29sLwYUmdHI5DPcJBdV03Qby9yB4oMvCrP9GYxowp23BbzURWQeEkJuA7w
	YwcCJPGsgYrhYSU69k6GpLHsccRWt+vOTdjps=
MIME-Version: 1.0
Received: by 10.102.170.16 with SMTP id s16mr10130091mue.16.1272981058787; 
	Tue, 04 May 2010 06:50:58 -0700 (PDT)
Received: by 10.103.247.13 with HTTP; Tue, 4 May 2010 06:50:58 -0700 (PDT)
In-Reply-To: <4BE016F8.8030505@balister.org>
References: <4BE016F8.8030505@balister.org>
Date: Tue, 4 May 2010 15:50:58 +0200
Message-ID: <g2i5725a2601005040650j7d76d003z2cd8e17c01c8bcf1@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error building image
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
X-List-Received-Date: Tue, 04 May 2010 13:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Seems like a python conversion error, python can't convert your string
into a number.
On a python command line on the same machine, could you try the following:

size = int("3016672617")
print size

Hopefully this should work on your python, if not there is something
wrong with the python itself.

I assume that the python is reading the size of some package and that
this string representing the size is either wrongly formatted or too
large.
If I look at the log correctly, then the size value is some 3 GB. Is
this correct?

Hope this helps,

Jan

On Tue, May 4, 2010 at 2:45 PM, Philip Balister <philip@balister.org> wrote:
> Does anyone know what is going wrong? It looks like so kind of uninitialized
> variable.
>
> http://tinderbox.openembedded.net/builds/70529/
>
> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


