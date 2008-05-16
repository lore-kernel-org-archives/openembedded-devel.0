Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jx7kx-0005xe-Cu
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 May 2008 23:46:27 +0200
Received: by an-out-0708.google.com with SMTP id b38so237823ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2008 14:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=oKQRrucAzjXb3TT/F6SYOzcAu45kYFJ/xGCmda/OjMU=;
	b=fp0I+BBhEtCCJW1BBLec3OFOUF/pNZ2jGkyja2qnVgA3/8VmbBgnA96Q5T0mjoESo1QBB102YtZlKnfkLli69+4kMkV0EKXZIicBSqUleZVnuZhsEY29K4Em4ybsvEe11Ed6yaaE1oPbAEiQPaWWn+f+2756pKpwHe8SqUb+xRA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=eM2+mDlykpdibGMM0mEgIGcFs/8K/SP9aNiX9rU29yqqeFzTPUwI1bpOQo+KBfcD26Y7EClEetLSliy/6G++d/uNBDMJcuzw1K/O6dJ0AQtgnRSuxa0AwLyxtS9+n8+B5QKDDTZK6pU6SYk+ebOuhX/GonI2giAFYAavElfEIdQ=
Received: by 10.100.41.9 with SMTP id o9mr5325671ano.84.1210974274241;
	Fri, 16 May 2008 14:44:34 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Fri, 16 May 2008 14:44:34 -0700 (PDT)
Message-ID: <c384c5ea0805161444m831aa10pdd558b05990f258d@mail.gmail.com>
Date: Fri, 16 May 2008 23:44:34 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1210887932.7097.107.camel@localhost.localdomain>
MIME-Version: 1.0
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
	<1210887932.7097.107.camel@localhost.localdomain>
Subject: Re: [RFC] Stop on multiple providers but none explicitly specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 16 May 2008 21:46:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On Thu, May 15, 2008 at 11:45 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Thu, 2008-05-15 at 20:51 +0200, Leon Woestenberg wrote:
>> On Thu, May 15, 2008 at 6:42 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>>
>> However, is it intuitive from the *user's* point-of-view to have
>> BitBake make this decision?
>> I think not; at least in the case of OpenEmbedded, there is at least a
>> 50% chance this is not what the user intended.
>
> You're making this sound clear cut and its not quite that easy :).
> Firstly, 50% isn't a good figure, there is no limit to the number of
> different packages which provide a given target so it could be 33%, 25%
> or worse.
>
No in fact, the chance of making the wrong decision is 50%, 67%, 75%
(or worse) for n = 2, 3, 4 etc.

(but I think you meant this).

> Secondly, there often is a good default choice its just bitbake doesn't
> have the information to make it.
>
Well this is exactly my point; Let's give bitbake that information for
the remaining cases.

PROVIDER_PREFERENCE seems a bridge too far for me, but hey, any
solution that solves it is better then the current situation.

Regards,
-- 
Leon


