Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JxriB-0000lU-Cl
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 May 2008 00:50:40 +0200
Received: by an-out-0708.google.com with SMTP id b38so374928ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 May 2008 15:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=qhTvhZnOwwl9zP7SCfLU6+HbSrx7is0L2LjAV20IKMo=;
	b=L1vhIfYi2ltD7DhGSqVsITDMkZPhfrATE0hVfTfQARRsXsVo+q/YZOD1Cq1ADk6/Ckt2b+9d7/SfhM/Mzaa3iyJSOHQO3/kJ9mqSTOWyxI6v7VfRAxJlt+Cszlwdjr77ux7A8zIN6zJGIvZvS5+gb4QgYI2NdbOjbxVdbzuujQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=IBDnW0jCdbrz0ob1ZQGitoUEU6cDn49NwpcFC4pEIzOXw4b/mo3mAJsVF6y14KAgGnk8QQY9+tFqR9wEGEQzJHWaO6H2Uvd/cb6O5YohHYh8qCTgGqRFya2Y8VXNOsTck9NjGQiDXa+9F9Y8b4UDqflBshMbMEM1qUou5AJuTCg=
Received: by 10.100.166.9 with SMTP id o9mr7042742ane.91.1211150909063;
	Sun, 18 May 2008 15:48:29 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 18 May 2008 15:48:29 -0700 (PDT)
Message-ID: <c384c5ea0805181548o7efe0dc5h5c79b0dccc0d4300@mail.gmail.com>
Date: Mon, 19 May 2008 00:48:29 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1211061548.5272.21.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
	<1210887932.7097.107.camel@localhost.localdomain>
	<c384c5ea0805161444m831aa10pdd558b05990f258d@mail.gmail.com>
	<1211061548.5272.21.camel@dax.rpnet.com>
Subject: Re: [RFC] Stop on multiple providers but none explicitly specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 18 May 2008 22:50:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard,

On Sat, May 17, 2008 at 11:59 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2008-05-16 at 23:44 +0200, Leon Woestenberg wrote:
>> PROVIDER_PREFERENCE seems a bridge too far for me, but hey, any
>> solution that solves it is better then the current situation.
>
> Its the only solution I can see which addresses the problem but it does
> further complicate the providers logic in bitbake which is already
> painful and in need of rewriting :/. Other solutions welcome...
>
The idea of bailing out when no preferred provider has been set is
(1) simple
(2) deterministic
(3) simple

Why make it harder then necessary? The stuff is complicated enough as
it is, especially for new ppl.

Regards,
-- 
Leon


