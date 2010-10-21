Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8w1r-0003lA-2v
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 16:22:03 +0200
Received: by ewy2 with SMTP id 2so100570ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Gros2DB1UK5OnjYQ6t8PkbEmi/Y8O0JSwFv05lQmMiA=;
	b=hmJif/9oASEt/p+LPInVClrKdNNqsee30OJy/PhgsxeCcxf1z1tfxQciNsIKY/dlud
	QMbiRE7UkF3G/WRJTANV+PBU2QhphXDmSvggH7te+eaMnyFdKHbciMFGxiwE1Ip+kcLa
	5x2Eo8kQx5Tx+7VRR9Ic/WXUsiSv7bVXoO1/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ODzi3pAAjJAiFJ6e77NyepmFHJoQEUbOyu9MegWx0aTvxGjFrqJ8sYaiq+8QQLV4ji
	r70pz0Ai51Xfz/8NMh8HUCDn/Hlq866NdPTdQNGlGFZ+MuivcoV/GHM6tErM1HgwKHKp
	78gV1o3fi28JXc4GcnlvUIeXdJdf9FeQ5HU20=
Received: by 10.216.186.207 with SMTP id w57mr9728560wem.19.1287670883402;
	Thu, 21 Oct 2010 07:21:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 21 Oct 2010 07:21:02 -0700 (PDT)
In-Reply-To: <i9p2uf$f40$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 21 Oct 2010 07:21:02 -0700
X-Google-Sender-Auth: HSztawoItigqLVkeoTV4LmzYYmI
Message-ID: <AANLkTimRhz=MvouJMyPYGOMjq2t8UpM+Zb7fSqjU+ZEK@mail.gmail.com>
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
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 14:22:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 21, 2010 at 2:59 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> The downside of amend.inc is the de-sync when the recipe gets updated,
> but not the overlay. You run the risk of using a version without the
> overrides that way.
> Maybe some fancy scripts, (pre-)commit hooks or just old fanishioned
> review on the ml could solve those type of issues.
>
> How do file overrides like
> recipes/netbase/netbase/beagleboard/interfaces get handled in a
> bblayer/amend.inc world?
>

You could adjust FILESPATHBASE in your layer.conf for the machine to include
${LAYER}/recipes/${@os.path.basename(os.path.dirname('${FILE}'))} or
something.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

