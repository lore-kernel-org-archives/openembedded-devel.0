Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QLyOV-0000hU-Db
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 16:03:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 056643150F19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 16:00:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ToUsX4JMcQMF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 16:00:38 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c46b9.pool.mediaWays.net [89.12.70.185])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 15F793150F0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 16:00:37 +0200 (CEST)
Message-ID: <4DD12E04.6050602@opendreambox.org>
Date: Mon, 16 May 2011 16:00:36 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305546074-18796-1-git-send-email-obi@opendreambox.org>
	<1305551007.5159.4.camel@mattotaupa>
In-Reply-To: <1305551007.5159.4.camel@mattotaupa>
Subject: Re: [PATCH] lib/oe/unpack.py: unpack rar archives
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
X-List-Received-Date: Mon, 16 May 2011 14:03:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/16/2011 03:03 PM, Paul Menzel wrote:
> Am Montag, den 16.05.2011, 11:41 +0000 schrieb Andreas Oberritter:
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  lib/oe/unpack.py |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/lib/oe/unpack.py b/lib/oe/unpack.py
>> index 8e8bf36..fa517d8 100644
>> --- a/lib/oe/unpack.py
>> +++ b/lib/oe/unpack.py
>> @@ -96,6 +96,8 @@ def unpack_file(file, destdir, parameters, env=None):
>>              if dos:
>>                  cmd = '%s -a' % cmd
>>              cmd = "%s '%s'" % (cmd, file)
>> +        elif file.endswith('.rar'):
>> +            cmd = 'unrar x %s' % file
>>  
>>      if not unpack or not cmd:
>>          if os.path.isdir(file):
> 
> 1. What program needs this? I am just asking to be able to test this.

A recipe in a private layer.

> 2. Will `unrar-native` automatically be build when such an archive is
> encountered?

No. IIRC, adding that dependency created a non-trivial dependency
problem. I figured it would be preferrable to use the host's unrar.

> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Thanks,
Andreas


