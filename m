Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6NDE-0006tx-EF
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 16:28:36 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so3189806veb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 07:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=dlLcUSOHAW3mptL8GDci+Ez2EPcoyFDam94JJUvnIJY=;
	b=Q+aY5HCe9StrnMoV3bQiqywVj9Tw6sjTcVoOpAeeAXEkdNSpdf2C5ck06ntaZkiZgZ
	YbRa8B24FXoloszRjxbj4xHRoTwOa+sWqu2dsD+shoRKdl1qKVPV0JjTLTseRWG34nT0
	YN9zQHdMFTecRyaIMoUaF8DfnmzNEHc86W02p6iwdNooVjM08mrtKdil/3b8aTANEhV0
	sCzDxVaBBFOfxHuVxfQn/h/BnBvORGLtOKH1HzBjd+2PNPqfJBxc7tifEqEx48pUcQcL
	3EqVTk/fkocgfBOYL46+5Ah+73kQq9aAPkK0dIdX0ZDMkDBO89BMfa2KC+EmfsASDE/W
	lXbA==
X-Received: by 10.52.32.230 with SMTP id m6mr3098416vdi.83.1360941148135; Fri,
	15 Feb 2013 07:12:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Fri, 15 Feb 2013 07:12:07 -0800 (PST)
In-Reply-To: <CAKSKmM3siHyHoNkqE02JQZcLBkkHKQyfpeTG2W1zfi+BVs0Tmg@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
	<CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
	<CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
	<CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
	<CAJTo0LayOQb60HB--SWiWBYau=ECryZx7Kn_QD21-G8kEMZiog@mail.gmail.com>
	<511E200D.3000907@communistcode.co.uk>
	<CAJTo0LbUmwwPs2eRvOBSCzep0OHx3KRn+XPO5xWSpcgbuN0RjQ@mail.gmail.com>
	<CAKSKmM3siHyHoNkqE02JQZcLBkkHKQyfpeTG2W1zfi+BVs0Tmg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Feb 2013 15:12:07 +0000
Message-ID: <CAJTo0LZbQ2YSR5+1vSqChMDq85Rnj+WgMr=U4=rdrePBsp27KA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnJNgO0UYjy0+DX3DTjA8/+WXA7I8miDSEFV/+VSFQ2SPu4+GA+CUhN2kXJPoCQbX77Vp/N
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Fri, 15 Feb 2013 15:28:36 -0000
Content-Type: text/plain; charset=UTF-8

On 15 February 2013 14:59, Sankar H Malarmani <sankar.m@hardcube.in> wrote:
> As I mentioned earlier I'm new this openembedded stuffs.. So, can you
> please guide me to build an image without hitting on any errors. Steps I
> should follow to get it..
> Your help is much appreciated..

Following the instructions on
http://developer.toradex.com/software-resources/arm-family/linux/source-code/linux-%28colibri-t20%29-openembedded
will go a long way to helping - at the moment you're building the
wrong pieces.

Ross


