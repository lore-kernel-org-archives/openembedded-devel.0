Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OqSFV-0001Ij-AK
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 16:56:39 +0200
Received: by ewy7 with SMTP id 7so3767624ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 07:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=JXS7V5uBQmWZrO0xDZjDSLHV1a29TxTAs84sJj38+7I=;
	b=ez/OSlGjlSVS8UyvJee/51VeVJsN4owJiwFLWMAdsbyw+Xwdewws/oLuK984Es5V9D
	ttJS+mDS5Sac8TQJcNh9px9lJd5DVqDNNA9tynxeAF+QMlFmkH7oRwijtVU12JZSk9Ae
	jdNtKJ6AvhsM52svPoxf9DcsnGHeThVV0+bF0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ZlxFrF3S9STv/UbW8MP/1T2/1gtR8VXiXauX/JMAD8PKJoqmKVhhmptiK8jTK2J6rg
	vAJiSW98EihOvkPOGez7b5Eh0CEZZ/7GwW3wadPk6WbRQ3CkryWhBEiF124DMBS8rCRY
	nexNDYdF6RKmjR42fxGyz/c4mXbmr30Ydsa7E=
Received: by 10.216.26.139 with SMTP id c11mr196552wea.6.1283265439305; Tue,
	31 Aug 2010 07:37:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Tue, 31 Aug 2010 07:36:59 -0700 (PDT)
In-Reply-To: <4C7CB4F0.4070306@freyther.de>
References: <4C7CB4F0.4070306@freyther.de>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 31 Aug 2010 07:36:59 -0700
X-Google-Sender-Auth: 1ln-WJLXpAL3X_lWuFyEIafkQtY
Message-ID: <AANLkTinjfJEgugVGTcJPnH-pVqgNcmjiHxp9EKmfaqk4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Latest base.bbclass commit breaks meta-toolchain build
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
X-List-Received-Date: Tue, 31 Aug 2010 14:56:48 -0000
X-List-Received-Date: Tue, 31 Aug 2010 14:56:48 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 31, 2010 at 12:53 AM, Holger Freyther
<holger+oe@freyther.de<holger%2Boe@freyther.de>
> wrote:

> with the latest change the task-host-sdk.bb tries to copy it on itself and
> cp
> breaks. Reverting the commit has fixed the issue for me. Years ago pb_
> added a
> "safe" append path function, I think it could make sense to use it here as
> well?
>

I think you misunderstood.  The latest base.bbclass changed oe_unpack_file
to use pb's path join function, and that's what caused the breakage.
Previously it was using os.path.join.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

