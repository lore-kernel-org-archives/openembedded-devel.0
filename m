Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P3UwL-0005Nj-Gj
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 16:25:54 +0200
Received: by bwz7 with SMTP id 7so19052bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=SaccN/qNcd2DIC5YeL3XnIf/Gj/KQo7P6OqAMUuAKXM=;
	b=EUiADLLeVF27MofI5C2XK+BYpgFgB1aBtTvxCINfGQjQdm1vKR9NTrqBmXeU8+XuQY
	wwVvtmyEAWU3gHtMDUMs32hUSugd2ghMjYU1U4QyzbOt0+mxz8u29UogOvucakfYTJbb
	+JdIksscPX0QHg1rqLQXCgNT+W5pBhjkehIYg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TNfDRWkxcwgvnVA47N4LHIcuvQQIhk6Dt3dOaOjB331hCNX2TNHPKq7hOxGPuVJJ4f
	c2htLFHpJrw71cWijkfM8uqwTObbahx3nUfFmVcrNZr/6DU5wnEFLu+GU0dj+DdzBF4k
	jmuWtcFOr/tJjDrCbwtgJbvGMKChNxIVtC3Zo=
Received: by 10.204.112.7 with SMTP id u7mr9507743bkp.70.1286375130599;
	Wed, 06 Oct 2010 07:25:30 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x13sm714633bki.12.2010.10.06.07.25.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 07:25:30 -0700 (PDT)
Date: Wed, 6 Oct 2010 16:25:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101006142538.GJ3264@jama>
References: <1286374774.3792.12.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1286374774.3792.12.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] mokosuite2: Add `libfakekey` and `vala-native` to DEPENDS.
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
X-List-Received-Date: Wed, 06 Oct 2010 14:25:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2010 at 04:19:34PM +0200, Paul Menzel wrote:
> 
> During the latest bumps of `SRCREV` I guess it was forgotten to add some dependencies.
> 
> `libfakekey` is needed for a successful configure and without `vala-native` `valac` is not found on a clean and minimal build system.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

IMHO no need to bump PR as it won't change resulting packages, but won't
harm as it builds quickly.

Thanks for spotting it.

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


