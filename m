Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1IunqK-0002LX-Qs
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 12:34:09 +0100
Received: by wa-out-1112.google.com with SMTP id l24so3035078waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 03:31:53 -0800 (PST)
Received: by 10.114.204.7 with SMTP id b7mr123357wag.1195640782482;
	Wed, 21 Nov 2007 02:26:22 -0800 (PST)
Received: from ?192.168.1.204? ( [24.107.180.75])
	by mx.google.com with ESMTPS id 6sm98026nzn.2007.11.21.02.26.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Nov 2007 02:26:19 -0800 (PST)
Message-ID: <474407BF.1000305@gmail.com>
Date: Wed, 21 Nov 2007 04:26:07 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1195552013.6337.18.camel@localhost.localdomain>	<db5939b2996965487cda218229f0b0ee@127.0.0.1>
	<1195577527.6337.39.camel@localhost.localdomain>
In-Reply-To: <1195577527.6337.39.camel@localhost.localdomain>
Subject: Re: Host dependency vs. -native packages balance
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2007 11:34:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/2007 10:52 AM, Richard Purdie wrote:
> On Tue, 2007-11-20 at 12:18 +0100, Esben Haabendal wrote:
>> On Tue, 20 Nov 2007 09:46:53 +0000, Richard Purdie <rpurdie@rpsys.net> wrote:
>>> On Tue, 2007-11-20 at 07:36 +0100, Esben Haabendal wrote:
>>>> Not having looked at the details of this bug, it seems like a good
>>>> example of how more host dependency creep into OE.
>>>>
>>>> I think it raises two questions:
>>>>
>>>> 1. Where do we want the balance between dependency on host installed
>>>> libraries and tools vs. OE provided -native packages?
>>>>
>>>> 2. How can we better handle or track the actual host dependency of
>>>> current OE?
>>>>
>>>> The current situation is that some (maybe even most) host dependencies
>>>> are discussed on the RequiredSoftware  and OEandYourDistro pages. They
>>>> are clearly not up-to-date and comments in bugzilla such as the one
>>>> below are a bit harder to find.
>>> Dependencies needed from the host system are those listed in
>>> ASSUME_PROVIDED. If its not listed in ASSUME_PROVIDED, OE shouldn't need
>>> it. If it needs something not listed, that is a bug.
>> Why are we then closing bugs with arguments such as "just install XXX on your host"?
> 
> They shouldn't be being closed with that IMO...

I apologize for closing that bug prematurely. I updated the 
OEandYourDistro->Debian/Ubuntu part in the wiki.

Gordon


