Return-Path: <diego.sueiro@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 62A086D799
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 18:52:34 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id ar20so14391677iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 10:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=rJwQPkd/aR4/6GU/NWp4XD+99t5rZjNqXjl7961kkq0=;
	b=JIIVUcZatMpfKC0iNhl8Yhq6/QbGvKNCMZFxAzbyUUk9TEJNBz2QrXKyJhoEuyYEme
	D2IqRvLPyZq/R8vpr/JnBfmbJdtyXJbr3luYUBMyLjPHXXzRFlLbGALQ6YemgUmj063/
	gVBiao79GQhCUXHN1zmaglujST5j9QJMQxDFCyvKWhJAtYtgX8eB0TYV/1jhHxS35Ohu
	l+8T37BHsXKZzYSuDgn0H72YrOQW78dkwflIyWxYBhlzUFQmmxp4ADUJTyPxdVqn+fZd
	CzuD29g/36rX7GTeIgxfCdffN32qV3RYKIh4En/IhrNKZufgGjOhVCRkTl4PicD67b8g
	JP9A==
X-Received: by 10.50.43.195 with SMTP id y3mr3082349igl.33.1385664753618; Thu,
	28 Nov 2013 10:52:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.26.233 with HTTP; Thu, 28 Nov 2013 10:52:13 -0800 (PST)
In-Reply-To: <20131128182423.GC3724@deserted.net>
References: <CAMCfZKEEYRnDP36tKtn=rqXEdY3VVucDMv0FdYntjYmaw3=fMg@mail.gmail.com>
	<20131128182423.GC3724@deserted.net>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 28 Nov 2013 16:52:13 -0200
Message-ID: <CAMCfZKFLW-FzmEDdquj2+H8ePnOOAZDGpoRPV+CPhD_VvzDW7Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Change to vsftpd recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Nov 2013 18:52:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 28, 2013 at 4:24 PM, Joe MacDonald <joe@deserted.net> wrote:

> Care to take a run at reverting 1c4921817 in your tree and see if that
> clears things up for you?  I'd do it myself but I'm waist-deep in a
> different investigation right now and it sounds like you might be able
> to do a quick test.
>

Joe,

I did not get this QA error.
The installed directory should be "/var/run/vsftpd/empty" and not
"/run/vsftpd/empty" as pointed on error message.
Did you added "install -d ${D}${localstatedir}/run/vsftpd/empty" on
do_install function?

Regards,

--
*dS
Diego Sueiro

/*long live rock 'n roll*/

