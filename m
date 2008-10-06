Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Kmz9g-0002ni-2B
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 01:06:20 +0200
Received: by yw-out-1718.google.com with SMTP id 5so532683ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2008 16:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=TwfF5ontmH60Mx19XtlTjNI9LdwFQK027o5gYYmzdc8=;
	b=FX3PQfI5lyMhSmPMO/nqmKOHM/2ZravgT5ZbOUQHHamuHrDfXaNmAldcCEMPJGDLK1
	cjaJIZLPKNQiOJT3WZDIbq92/SE8d+1/yNWIf0zDMjMN5uJBkhMvZmIYp2kfEvpjVQwX
	Wy6mCOWArrt5MXqaiVx7VveOj0s0NxO82mmB8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=WnlLGgKPUi4u1RRrTMkEJKyI8ul73wbsII2l046I2EfeTyn/CnyCMTFTr2XZ8LDcDW
	7xxUoRKQAMKYF2diwQRpGik/ojTAeasbiBZLzEVjO/6pILMxYReJXcXKEuWMgzoFMipR
	1RCklNayDuyR+NaN3GnsvpYPnWJi9/JZdzgMc=
Received: by 10.100.205.15 with SMTP id c15mr5801710ang.67.1223334108684;
	Mon, 06 Oct 2008 16:01:48 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Mon, 6 Oct 2008 16:01:48 -0700 (PDT)
Message-ID: <c384c5ea0810061601l382428a3rc8efc6c10fd928ca@mail.gmail.com>
Date: Tue, 7 Oct 2008 01:01:48 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gcdpfj$hr0$1@ger.gmane.org>
MIME-Version: 1.0
References: <gc35ba$voi$1@ger.gmane.org>
	<c384c5ea0810061210l65b4178ay812a9681a4e86dda@mail.gmail.com>
	<gcdokp$evo$1@ger.gmane.org> <gcdpfj$hr0$1@ger.gmane.org>
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Mon, 06 Oct 2008 23:06:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

On Mon, Oct 6, 2008 at 9:38 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> I suspect packaged-staging is using the old staging packages (as can be seen
> from the do_setscene in the gcc tinderbox log). Could you try it without
> keeping pstage?
>

Hmm, normally my Makefile clean target clean the complete TMPDIR.
Maybe this project is misconfigured, thanks for the heads-up on the
setscene step.

Thanks,
-- 
Leon


