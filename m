Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id CCD887700E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2015 09:06:34 +0000 (UTC)
Received: by qgez77 with SMTP id z77so144265473qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Oct 2015 02:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=xxYWXAZHnk1mr5W1uy+YHevWS2VYforzqcMdLQb140k=;
	b=IrUWFs2cdcvs4/NZEavsJ+M4b8uh6FNAasE6+iClFb6iZXm+kS1iGgGbduvY+VlK2x
	DhbVTkcKFiz6y+hizgRZBY9kJDPHlESAtol1nZFKzyoqSY5B8IxyGlzh4tiY9axNtigA
	7EPc+17Zu1+qABd8Azk4RS9gEleUju0AACEdX9NF3DUR38i3dVUNLnKdFW6x39MFk9kZ
	oaIGFg1R/E0z1XQXDe059UT6epuVCroyzXWeoH6/B+s+8KBRbKF4ojfB5AvSEIVL4FuB
	yknvupYuU7Vhqb7lC4gZZjmxfhnIiM2XwNg7KHi8Uy2m9OQKdfjfc6XfjNrVhMpXw5Bq
	VjKw==
X-Gm-Message-State: ALoCoQnIQbagqP2VWGKGvGZg06u6W14SG5wSP1vrn4F1LBUMZLHBXde5x59+mhqDjQWDunFV4p4j
X-Received: by 10.140.235.147 with SMTP id g141mr37576978qhc.22.1444035994226; 
	Mon, 05 Oct 2015 02:06:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 5 Oct 2015 02:06:14 -0700 (PDT)
In-Reply-To: <1443904562-21819-1-git-send-email-manuel.bachmann@iot.bzh>
References: <1443904562-21819-1-git-send-email-manuel.bachmann@iot.bzh>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Oct 2015 10:06:14 +0100
Message-ID: <CAJTo0La71ae2eMfyqPqSWo1QyNy+Yq7e7hJsZXtnB8Un8KyHBA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 3/3][meta-multimedia] rygel: Add recipe
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
X-List-Received-Date: Mon, 05 Oct 2015 09:06:37 -0000
Content-Type: text/plain; charset=UTF-8

On 3 October 2015 at 21:36, Manuel Bachmann <manuel.bachmann@iot.bzh> wrote:

> Rygel is a UPnP Audio-Video media server, that allows to
> share media files to other devices. It can also become a
> MediaRenderer controlled by UPnP or DLNA Controllers.
>
> Rygel makes use of the GStreamer library to recognize and
> index media files. UPnp clients will then be able to browse
> through them with the aid of metadata (artist, date...).
>
> (we do not propose to build without GStreamer support,
> because then if cannot parse any actual media file, and
> this is pointless)
>

It's a fair bit out of date now but meta-openembedded-contrib has a
ross/gupnp branch which adds a Rygel recipe but also more configuration
options and flexible packaging.  It would be good to merge both recipes
together.

Ross

