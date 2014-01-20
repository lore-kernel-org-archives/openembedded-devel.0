Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 109D96CBD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:51:53 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W5DOP-0000Ee-IK for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jan 2014 12:51:49 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 12:51:49 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 12:51:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 20 Jan 2014 12:53:09 +0100
Message-ID: <lbj2ju$fnu$1@ger.gmane.org>
References: <1390043044-20352-1-git-send-email-koen@dominion.thruhere.net>
	<20140119134327.GB5565@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <20140119134327.GB5565@jama>
X-Enigmail-Version: 1.6
Subject: Re: [RFC][meta-oe][PATCH] jenkins: add 1.547
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
X-List-Received-Date: Mon, 20 Jan 2014 11:51:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 19-01-14 14:43:
> On Sat, Jan 18, 2014 at 12:04:04PM +0100, Koen Kooi wrote:
>> The package split is based on the debian packages which have
>> -common/-server and -slave.
>> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> ---
>> 
>> This introduces a dependency on meta-java, which is of course a big
>> no-no for meta-oe :( That leaves me with a few questions:
>> 
>> 1) What's the best place for the jenkins recipe?
> 
> That's really hard question, I can only think that meta-java or completly
> new layer would fit.

That's what I feared, I'll think about creating yet-another-layer.

> 
>> 2) Do we have a virtual/runtime thing to express a dependency on
>> /usr/bin/java without dragging in meta-java?
> 
> I think this isn't enough, because it would still show error that 
> virtual/java-foo isn't provided in included layers.
> 
> You can make it PACKAGECONFIG (sort of like RP did with python for 
> opkg-utils) which means that without PACKAGECONFIG change it won't build 
> at all.
> 
>> 3) Any ideas for the contents and deps of the jenkins-slave package?
> 
> Just something like jenkins user and runtime dependency on java and
> leave slave setup on jenkins master?

That is pretty much what I had in mind, except I'd like to add openssh-sshd,
scp and rsync to the mix as well.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS3Q4lMkyGM64RGpERAisiAKCePl0geAlE8oVO8jVJ7iyrKW+I2ACgrJeG
N9n2LW9ZUqt2eW8Z0QAjiHk=
=mDag
-----END PGP SIGNATURE-----


