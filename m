Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV4DF-0005OL-Sb
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 20:14:42 +0200
Received: by mail-ve0-f174.google.com with SMTP id b10so871147vea.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 10:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=z1+pvhpYsEjIQ1OCJLZCE7ofdXPYVpdLMG9mwk2mj4g=;
	b=eydjjF5ka1Eov8AEjuscfwUciFpPgLQaMmiz+Eg54NhUgs/8fz8Ynw2+K0cdwRd6R7
	gJjCl1KH+zp2wgPd0qbxIgEIaQmSvIZyi6SZfCgPyC+8ggWd6euD7GjrbtGcxTAu3iSV
	cfvSZknIQJI8C4Rbje0zPCkrwrAAI+7qGL5pxQPLIyh0roCw/d11NZrGWhsdv12Ne7CL
	UtP59pPMAVKv6jd0qo8IGNuCM/Z2WPOnR5eAESUh+AYNld/9chLd8mE7F1jWkK1BH/S7
	d1KbdovVHE7fQ9Lv/oS8mPVDBVlyLNpZRT9XNfAx7Vwob7JLK9EOcOBPLxAVx1QnVj+i
	Fu4Q==
X-Received: by 10.52.158.163 with SMTP id wv3mr21897747vdb.82.1366826215289;
	Wed, 24 Apr 2013 10:56:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 24 Apr 2013 10:56:35 -0700 (PDT)
In-Reply-To: <CAJTo0LZjn0dDMJO8b1FwtCXjoBEH-Ck8qzOQEHMRxhcCsHuaLw@mail.gmail.com>
References: <cover.1366821077.git.ross.burton@intel.com>
	<83aca51e5e0866d965d4d9f621cacb29c84a6875.1366821077.git.ross.burton@intel.com>
	<1522401.Xi5ZNlSlZv@helios>
	<CAJTo0LZjn0dDMJO8b1FwtCXjoBEH-Ck8qzOQEHMRxhcCsHuaLw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2013 18:56:35 +0100
Message-ID: <CAJTo0LbK_ycWpCAvYFfs+rv=sDe2Lg3HuxTFq_4D1S1WQWPsOg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQn4HslVugt05D1qfDXsJJMa4Y1Kc2rFQzSes807AbLIyQZcNhPxvQrcQV5O1lAcm2Knzgz/
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] libgnome-keyring: add (from oe-core)
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
X-List-Received-Date: Wed, 24 Apr 2013 18:14:45 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2013 18:49, Burton, Ross <ross.burton@intel.com> wrote:
>> libgnome-keyring is already in meta-gnome (under recipes-
>> gnome/libgnome/libgnome-keyring_2.32.0.bb - perhaps not the best location).
>> gnome-keyring isn't though.
>
> Whoops, so it is.  There's quite a massive delta between the two, I'll
> check that this is due to the oe-core version having better
> maintenance and not something subtle that I'm missing.

The existing libgnome-keyring is missing all of the build-dependencies
and has odd classes.  I'll send a V2 that deletes that old recipe and
adds the new one in a better location.

Ross


