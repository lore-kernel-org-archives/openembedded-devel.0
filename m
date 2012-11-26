Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TcwN7-0000I6-JC
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:57:05 +0100
Received: from localhost ([127.0.0.1]:35585 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Tcw9O-0008Rf-5P
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 10:42:54 +0000
Received: from [195.171.99.130] (port=56725 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Tcw9O-0008RU-30
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 10:42:54 +0000
Message-ID: <50B34831.10402@communistcode.co.uk>
Date: Mon, 26 Nov 2012 10:45:05 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
	<1353864310-20097-7-git-send-email-eric@eukrea.com>
	<50B3440E.9080600@communistcode.co.uk>
	<20121126113056.6385c072@eb-e6520>
In-Reply-To: <20121126113056.6385c072@eb-e6520>
Subject: Re: [meta-webserver][PATCH 7/7] hiawatha: add CONFFILES and a php example
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
X-List-Received-Date: Mon, 26 Nov 2012 10:57:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 26/11/12 10:30, Eric Bénard wrote:
> Hi Jack,
>
> Le Mon, 26 Nov 2012 10:27:26 +0000,
> Jack Mitchell <ml@communistcode.co.uk> a écrit :
>
>> On 25/11/12 17:25, Eric Bénard wrote:
>>> +    # configure php-fcgi to have a working configuration
>>> +    # by default if php is installed
>>> +    echo "Server = ${bindir}/php-cgi ; 2 ; 127.0.0.1:2005 ; nobody:nobody ; ${sysconfdir}/php/hiawatha-php5/php.ini" >> ${D}${sysconfdir}/hiawatha/php-fcgi.conf
>>>    }
>> Looks good to me, thanks for the improvements Eric!
>>
> I still have to find a good way to provide a default
> ${sysconfdir}/php/hiawatha-php5/php.ini and launch php-fcgi in the init
> script if php is enabled.
> Do you think we could provide the file php.ini in the hiawatha recipe
> (as hiawatha's doc recommends setting some options :
> http://www.hiawatha-webserver.org/howto/php_configuration ) ?
>
> Eric

The only way I could think of doing it would be to have some sort of 
test to see if PHP is installed and then possibly sed the php.ini file 
to set the correct values.

On the other hand, a note in the BB file may be enough and OE users 
shouldn't really need their hands holding to this level.

As for the init file, I use PHP and Hiawatha as normal CGI rather than 
using a fastCGI daemon, therefore I don't think it would be appropriate 
to automatically start the fcgi daemon. We could possibly ship a 
seperate fastCGI init file, although not automatically enable it?

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



