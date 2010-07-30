Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OekTf-0004VN-8x
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 09:57:59 +0200
Received: by fxm12 with SMTP id 12so733084fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=0ZtucFHCAP/4k8nU3Wwczbo+T8fnLViGB7Yvau/ufLs=;
	b=PQwhpHgEZRXTSKb9SfFfBEYgkrWB3qjOdxmHgRgSAxF99SbZ3fgMz7WySdwM/01cdH
	iJa08bQMjjaWX66UxdQRS/S3cmk4ikVU1dSgpeL3SlMP28pZxQMjiiP1bu55KGdgG5A5
	+JGIy21I2cjxMAqilJekswkqCCHAYY5QUxFSQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hRPfAM0bm+kX9KW/6O1xt7vHGT18jQB+MLkRKw/q1f5bUz4rclGfdyaTLE5gWOGQt2
	zk3KeYCVbhetjAmGwhxAr2/dp9jAS1+qk9NcBcDojxcf28aAPYzUI5+wnqgy5ttwPhBp
	yykOZiRyut0j5WTmtYEqBHcWYPBhETf9dIkmg=
Received: by 10.223.104.70 with SMTP id n6mr1457985fao.104.1280476655813;
	Fri, 30 Jul 2010 00:57:35 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id h8sm691141faj.38.2010.07.30.00.57.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 00:57:34 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OekTD-0003gR-VQ; Fri, 30 Jul 2010 09:57:31 +0200
Date: Fri, 30 Jul 2010 09:57:31 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20100730075731.GD12277@mx.loc>
References: <1280415061-28353-1-git-send-email-chase.maupin@ti.com>
	<20100729205504.GE29814@mx.loc>
	<131E5DFBE7373E4C8D813795A6AA7F0802E9149617@dlee06.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0802E9149617@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] distribute_license: added class to copy license files
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
X-List-Received-Date: Fri, 30 Jul 2010 07:57:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 29, 2010 at 04:46:55PM -0500, Maupin, Chase wrote:

>> >+    set -f
>> 
>> hush: set: -f: invalid option
>
>I thought bash was the standard shell for working with OE.  Is that wrong?

You're right, it is (and -f is a mandatory flag so disregard this,
sorry)

>> >+        res=`find . -maxdepth ${LICENSE_SEARCH_DEPTH} -name "$lic"`
>> >+        if [ "$res" != "" ]
>> 
>> breaks on older test(1) impls that don't handle empty strings properly.
>> Could be that this one is moot by now though.
>
>So did this break for you?  I've never seen this issue.

[ -n "$res" ]
>
>> 
>> >+        then
>> >+            mkdir -p ${DEPLOY_DIR}/licenses/${PN}
>> >+            cp $res ${DEPLOY_DIR}/licenses/${PN}
>> 
>> install -D ${DEPLOY_DIR}/licenses/${PN} ${DEPLOY_DIR}/licenses/${PN}
>
>I'll change this

typo of mine: the first non-option argument should have been $res, of
course.

essentially you mean (if you say it in sh)
set -f
for lic in ${LICENSE_FILES}
do
  find ${S} -maxdepth ${LICENSE_SEARCH_DEPTH} -name "$lic" | \
    while read f
    do
      bn=$(basename $f)
      if [ -r ${DEPLOY_DIR}/licenses/${PN}/$bn ]; then
        # we could have used $d.$bn for per-dir licenses
        # d=$(echo $f | sed -e "s|${S}||" -e normalize-and-convert-slashes-to-underscore)
        echo "ERROR: possibly conflicting licenses"
        exit 1
      fi
      install -D $f ${DEPLOY_DIR}/licenses/${PN}/$bn
    done
done
set +f

This leaves you with just one non-standard hunk: -maxdepth
Given that both findutils as well as busybox support -maxdepth i would
not bother much.
Just a thought.. your initial version may be sufficient for most
practical reasons.

cheers,


