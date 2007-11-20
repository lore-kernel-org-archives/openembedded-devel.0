Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IuR9k-0001HQ-2E
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 12:20:40 +0100
Received: from bq8.dotserv.com (localhost [127.0.0.1])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lAKBIVdL006663
	for <openembedded-devel@openembedded.org>;
	Tue, 20 Nov 2007 12:18:32 +0100
Received: (from apache@localhost)
	by bq8.dotserv.com (8.13.1/8.13.1/Submit) id lAKBIVg3006660;
	Tue, 20 Nov 2007 12:18:31 +0100
X-Authentication-Warning: bq8.dotserv.com: apache set sender to
	eha@doredevelopment.dk using -f
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Date: Tue, 20 Nov 2007 12:18:31 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
Organization: =?UTF-8?Q?Dor=C3=A9_Development_ApS?=
In-Reply-To: <1195552013.6337.18.camel@localhost.localdomain>
References: <1195552013.6337.18.camel@localhost.localdomain>
Message-ID: <db5939b2996965487cda218229f0b0ee@127.0.0.1>
X-Sender: eha@doredevelopment.dk
User-Agent: RoundCube Webmail/0.1b
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
X-List-Received-Date: Tue, 20 Nov 2007 11:20:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Nov 2007 09:46:53 +0000, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2007-11-20 at 07:36 +0100, Esben Haabendal wrote:
>> Not having looked at the details of this bug, it seems like a good
>> example of how more host dependency creep into OE.
>>
>> I think it raises two questions:
>>
>> 1. Where do we want the balance between dependency on host installed
>> libraries and tools vs. OE provided -native packages?
>>
>> 2. How can we better handle or track the actual host dependency of
>> current OE?
>>
>> The current situation is that some (maybe even most) host dependencies
>> are discussed on the RequiredSoftware  and OEandYourDistro pages. They
>> are clearly not up-to-date and comments in bugzilla such as the one
>> below are a bit harder to find.
> 
> Dependencies needed from the host system are those listed in
> ASSUME_PROVIDED. If its not listed in ASSUME_PROVIDED, OE shouldn't need
> it. If it needs something not listed, that is a bug.

Why are we then closing bugs with arguments such as "just install XXX on your host"?

/Esben



