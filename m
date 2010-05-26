Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHIB4-0002lz-E3
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 17:05:51 +0200
Received: by vws20 with SMTP id 20so4156198vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=uaoZo+oaEHOH3bUeX4tiv6jRnrMK4U0iWSIGIm5RdDw=;
	b=cu95l8MPhVL4Ewac84+PKamEr3P9r7VcCyLofoI2Ycw2ZdGvSlz0gZeoRTsoOzxVm/
	H75Mvb1gHiKAB9p6vDRZYor5j+hKfNm0wJvDbnlToo/ult+uEha0s8VrkATRTpFLzljZ
	dSHWvsl6C6/tNa8GhYFczhKB2hw1wV/rPaeRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=MQUwMwQP3twsKE6wkpTolq5CNc9CSdLI6Won8t8NIVENRhK2Tb95kbGbBoCO5kNJn5
	iudITMcWtmrTJHDPyPu/kDmXNNeklBfI7/vk8OfwMU5PHOrLN01Z4sHKbXXafT6bvKIo
	1NuysWllITJ01Kd/YuJct5ASqHqHFmxzyd7jo=
Received: by 10.224.73.12 with SMTP id o12mr5040289qaj.53.1274886101378; Wed, 
	26 May 2010 08:01:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.215.15 with HTTP; Wed, 26 May 2010 08:01:20 -0700 (PDT)
In-Reply-To: <1274872334-31018-1-git-send-email-raj.khem@gmail.com>
References: <1274872334-31018-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 26 May 2010 08:01:20 -0700
X-Google-Sender-Auth: DLA7kBkM2xQTiXULnJz3icevH5o
Message-ID: <AANLkTinPfWPOdbvMi2oehrpzVKqCzghrhW0DfZ7wwep4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] image.bbclass: Make zap_root_password to disable root's password not the user root itself.
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
X-List-Received-Date: Wed, 26 May 2010 15:05:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 26, 2010 at 4:12 AM, Khem Raj <raj.khem@gmail.com> wrote:

> * With shadow now running pwconv after commit
> 7c5f81b2139e55622ca2f23ff6b63438d4825d87
>  It converts :*: passwd entry into equivalent /etc/shadow entry :*:
>  which in shadow means disable the account as per
>
> http://tldp.org/LDP/lame/LAME/linux-admin-made-easy/shadow-file-formats.html
>  As a result root can not login unless one boots into shell and then
>  resets the password.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Seems reasonable.

Acked-by: Chris Larson <clarson@kergoth.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

