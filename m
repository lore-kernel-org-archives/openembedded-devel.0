Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id ED0EC780F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:12:15 +0000 (UTC)
Received: (qmail 28892 invoked by uid 1003); 9 Jun 2017 13:12:16 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.118.141)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	9 Jun 2017 13:12:16 -0000
To: =?UTF-8?B?0JzQsNGAJ9GP0L0g0J/RgNGW0YbQsNC6?= <maryan.pricak@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <CAGyDAL=5H0Adx81rNMKiBjmF3itmKZYQ1y+FW0EhuQyz=eJivw@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <d0363d1f-e66d-0801-b1e8-f46ddb8d9cf7@balister.org>
Date: Fri, 9 Jun 2017 09:12:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAGyDAL=5H0Adx81rNMKiBjmF3itmKZYQ1y+FW0EhuQyz=eJivw@mail.gmail.com>
Subject: Re: About recipe for hireidis
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
X-List-Received-Date: Fri, 09 Jun 2017 13:12:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2017 08:51 AM, Мар'ян Пріцак wrote:
> Hi all,
> 
> I was looking for hiredis recipe and found it in Intel's IOT layer
> https://layers.openembedded.org/layerindex/recipe/33258/
> Is it a good idea to move it to some generic place like meta-oe where redis
> (https://layers.openembedded.org/layerindex/recipe/838/) recipe is, or
> should I include Intel's IOT layer to build hiredis?

I did a quick search for redis in the layer index:

http://layers.openembedded.org/layerindex/branch/master/recipes/?q=redis

It certainly looks like moving it to meta-oe makes sense as the hiredis
recipe already DEPENDS on the redis recipe from meta-oe.

Philip


> 
> BR,
> Marian
> 

