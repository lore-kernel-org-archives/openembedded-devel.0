Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seth.boll@gmail.com>) id 1TPv2a-0000TY-NW
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Oct 2012 14:54:04 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so1652520obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2012 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gN+Kn8LDz9Pf7NyeXjGKZKE9g9CaabJlGqJrexrfBuo=;
	b=yGcjx6FnHf0x92wiUeZc8mfzwiNoGV8t90I1WX50d4TV7z5WnM8Ozy+Y1gxWaZPNxx
	UY5TSWGrA+JV5SS27eyedpVxPID5vP8N1lCqlBYX5BMFvQzKvUxWXWHO82H5jW4GonW7
	ce7eLnYuNdPEDgIfwSfxiA/rnjRw+HldykdUA1kQlycJ306lWT9t36jJfizRTHxyQ9kb
	//ravNNMw+OtZ2QO2vMLygqmSQmRW8vb+u6rYHMXnylvQIi7RF+6gAtp5P2NMCVoVxNx
	hSsIqUbuQPiV2QrHxoFxve0RRGa9EZ2KlHkFFfFBmt8S9lwQP7wQRW2el8D9CRUYWe9N
	1QnQ==
MIME-Version: 1.0
Received: by 10.60.27.71 with SMTP id r7mr5835353oeg.96.1350823240909; Sun, 21
	Oct 2012 05:40:40 -0700 (PDT)
Received: by 10.76.74.105 with HTTP; Sun, 21 Oct 2012 05:40:40 -0700 (PDT)
Date: Sun, 21 Oct 2012 07:40:40 -0500
Message-ID: <CA+JN8xOMto9pzsFSgCfK0ij=pZ2LFYDxQsPwjObSyv5yYRtU2Q@mail.gmail.com>
From: Seth Bollinger <seth.boll@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: AUTOREV problems
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
X-List-Received-Date: Sun, 21 Oct 2012 12:54:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello All,

I've been having some serious problems trying to get my image to rebuild
recipes when their upstream repositories have changed.  I have SRCREV =
${AUTOREV} in my recipe and in bitbake -e I see these 2 lines:
# SRCREV=${AUTOREV}
SRCREV="AUTOINC"

I've found BB_SRCREV_POLICY and I've set that explicitly to clear, even
though that seems to be the default.  Auto didn't seem to work, even though
it looks like it should from the code.

When I try rebuilding my recipe, it seems to find that everything is cached
and doesn't even attempt the fetch, even though I know the repository has
changed (that's the reason I want to rebuild :)).  I've tried whacking
tmp/cache/*, but that didn't help.  I tried whacking the stamp for
do_fetch.  That didn't help unless I explicitly built using the "fetch"
command, then it at least appeared to fetch.  However, when I tried to
build the image after that, it didn't try to rebuild the recipe that had
just fetched.

The only way I could get it to rebuild was to cleansstate on the recipe and
then rebuild the image.  I assume this isn't the way it should be working.

1.  What is the expected operation of bitbake builds for recipes using
autorev?
2.  How can I get my autorev recipes to rebuild when their repositories
change?
3.  If this is working for everyone else, how can I find what I have
screwed up?  :)

Thanks,

Seth

