Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OsioP-0000yT-GK
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 23:01:13 +0200
Received: (qmail 10777 invoked by uid 503); 6 Sep 2010 21:22:53 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 6 Sep 2010 21:22:53 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Sep 2010 23:00:30 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 6 Sep 2010 23:00:29 +0200
Message-ID: <4C855669.8050905@eukrea.com>
Date: Mon, 06 Sep 2010 23:00:25 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283798935-4819-1-git-send-email-eric@eukrea.com>
	<AANLkTinZzUuqZTPN_-XfqYPrQXgVcjPCQh34c2F9D0kX@mail.gmail.com>
In-Reply-To: <AANLkTinZzUuqZTPN_-XfqYPrQXgVcjPCQh34c2F9D0kX@mail.gmail.com>
X-Ovh-Tracer-Id: 6227633861306264905
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lib/oe/unpack.py: fix uncompressing .gz .bz2 or .xz
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
X-List-Received-Date: Mon, 06 Sep 2010 21:01:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

Le 06/09/2010 21:50, Chris Larson a écrit :
> On Mon, Sep 6, 2010 at 11:48 AM, Eric Bénard<eric@eukrea.com>  wrote:
>
>> * Actually, the destination file has the full path (ie it's uncompressed
>> in the download directory) as only the extension is removed.
>> * By also removing the path, this patch should fix this problem.
>> * An other fix could be to no uncompress to stdout but let gunzip|bunzip2|
>> xz uncompress directly to the file.
>>
>
> Thanks for looking into this.  I appreciate your putting together a fix.
> See code comments below.
>
> Please improve the wording of the commit message here.  "has the full path"
> is unclear.  I'd suggest referring to the fact that it's currently writing
> into the *source* path rather than the *destination* path, to clarify a bit.
>
>      elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
>>          base, ext = os.path.splitext(file)
>> +        ext, base = os.path.split(base)
>>
>
> This variable naming is wrong and misleading.  The leading portion of the
> split is not an extension, so 'ext' is not correct.  Also, you just throw
> away the leading portion anyway, so there's no need to use os.path.split at
> all.  Instead, I'd suggest changing this:
>
>      base, ext = os.path.splitext(file)
>      cmd = 'bzip2 -dc %s>  %s' % (file, base)
>
> to this:
>
>      root, ext = os.path.splitext(file)
>      cmd = 'bzip2 -dc %s>  %s' % (file, os.path.basename(root))
>
thanks for the review. I've updated the patch following your comments.

Eric


