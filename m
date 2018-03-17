Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 873697889F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Mar 2018 03:50:24 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id z143-v6so3885630itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2Wsa1L2JjixihMWmc23pHDsu2di9aWuq6GPHFx8fJb8=;
	b=rHbq/eiWYMqrJhehWi92b0aUHGh0Y65CxJNIvcIUG+CKOLKjtS/zc90YoSf5KqwmXO
	jHwiXwdPzcYpeDJtNhkvIclzW8cTcYmPinG7cDaBjRuCUAUCxeIitLGh3qF37p+KDHMk
	jvu2iPPuCE1O0vPHTrlGn3bkcU2j3UyQKqGtQjq4+MXM3L00Tq/QlWIO1yh/Jft8djAo
	T7gPIyrgenZ1P78J3OsYMiTveBbkiYVlPYcdNYbAtWtQlmV7sawVhugkirG2pCxXogtO
	vGRqUxCO8JyCrj1FV8ZRIZMuVoIaj7vz/dnzk93ST5Dng30s2K8+tYpzgJIb+KdK3pYT
	Yd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2Wsa1L2JjixihMWmc23pHDsu2di9aWuq6GPHFx8fJb8=;
	b=Z82RZeFL1I4WGNXcxA3WZVUg10J3NyVEnbxKd++qHi6D3ReaH2k45ZTz0wHDQgqlP5
	qlYY3tufB6vo3vzWtM01dc+7wtbTVmLO8K5xuTIjpucKbJ+wsBUbg/k7/lACEIczhKSd
	5cup94YWIj4HW51T2ogWZkymh8rrv8++ovP2LomLHymowjU2BmbAHfyBsUNB6boErFH5
	cz9k5pZWowONBt1SAieQa6Aj9YpLHMO9QgFr53D2n4qdSiZ65OH21J2W+rMlIzYH3yV7
	tjuf0b9VU3TF1kYExKtIo6mU8rYMx3lHfNoq9ows/YK6MEn8uBh4Ewh3AlkdxntYiGeM
	1Fcw==
X-Gm-Message-State: AElRT7FMhQAaJtqq/20eFOXH8wlgJaxlPUdO8mUXj9faG0ysZTEyiZm0
	7WQqA78FmKYKgI2yXqnqm7z4qXe8
X-Google-Smtp-Source: AG47ELuDbe6uQFAsThoFwIMYxPOA14KvyALhAJUg1adjnCrNNUVT/Wvkd2cMiAWwE8B36vqBuvFAHw==
X-Received: by 2002:a24:98d6:: with SMTP id
	n205-v6mr4628607itd.130.1521258625136; 
	Fri, 16 Mar 2018 20:50:25 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	193-v6sm5467923itf.1.2018.03.16.20.50.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 20:50:23 -0700 (PDT)
Date: Fri, 16 Mar 2018 23:50:21 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-ID: <20180317035021.GA19189@linux-uys3>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
	<1519163708.24236.337.camel@linuxfoundation.org>
	<CA+chaQd=QE4fc32LDKepRsNn0gtuyQSfFi3aQ2YxmRbZtJjp1Q@mail.gmail.com>
	<1519170075.24236.345.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1519170075.24236.345.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: Splitting meta-oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Mar 2018 03:50:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue 2018-02-20 @ 11:41:15 PM, Richard Purdie wrote:
> The separate layers and maintainership is the way we designed the new
> layered approach to OE to scale.

I only became an active user of OE after the OE-classic split; I had used it a
couple times during the OE-classic era, but not very deeply. Therefore: my
apologies for not having a fuller understanding of the issue(s).

Would anyone like to make an honest, unbiased attempt at answering:
1. What problem(s) was the post-OE-classic split attempting to solve?
2. Did it work? Can it be said that the problem(s) the OE-split was attempting
   to solve, have actually been solved by the split? (and, if new problems
   arose as a result of this split, were they small an manageable relative to
   the pre-split problems?)

The experiment to decide whether we need more splits or consolidation has
already been done. Have the results been sufficiently understood?

