Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Pweib-00027x-QL
	for Openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 18:59:41 +0100
Received: by fxm8 with SMTP id 8so4331840fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2011 09:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=g5maonEgl8dcYij8RqOBYszUXESPFw5UgAJ4anSZqeM=;
	b=he+KZEq4rRLpfnPzAcC6gSkAMz6xKbQ3w1YScd4Bvjj9GM+XzJ4aO85liXqBc+YsTT
	kZy/agEUik4L9vMLIJg7CtXy0ARxIOymvdNET4g/j481C7Jwp8ZMYDbqFkexeA1Nxkvx
	ttIqgbSWQvRZSO0O1s9zEAjj0TAY7OV/N22GQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=QRMOBXysTMvmAmS7T8XjK4hBmfLg/idbgkG7R+eZBbg3wiSB3LLYTSrVZuCLiueH5D
	SxVeKVwO72//M0DNnlj4ugLd6dDqncl+fpdfKR3hdeZHFMoY8DYAjiHQF3X56aiJfdAx
	sHKj5vO9LM1YWl7ZNwjOv9LomTBSyYAilbvcs=
MIME-Version: 1.0
Received: by 10.223.30.66 with SMTP id t2mr5175778fac.16.1299520688647; Mon,
	07 Mar 2011 09:58:08 -0800 (PST)
Received: by 10.223.151.6 with HTTP; Mon, 7 Mar 2011 09:58:08 -0800 (PST)
Date: Tue, 8 Mar 2011 06:58:08 +1300
Message-ID: <AANLkTikzk175mvsX+JCC7Mfm_gt=xdxG67NR4v5WF8x9@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: How does oe handle rebuilds?
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
X-List-Received-Date: Mon, 07 Mar 2011 17:59:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

I find I often have problems when using oe that changing a recipe does
not result in dependent packages being rebuilt. A bit of Googling
suggests that many experience this issue and take manual steps to
force rebuilding.

For example, changing the kernel requires rebuilding various libraries
(tslib etc) and rebuilding the image.

1.Should oe be able to handle that automatically or is this oe's
"killer defect" (ie. opposite of "killer feature").
2. Is there something missing in recipes to show the correct dependencies?
3. What is the best way to manage these stale dependencies?

Thanks

Charles


