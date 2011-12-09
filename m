Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RZ6wN-0000VB-Tm
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 21:21:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB9KEFLV028109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Dec 2011 12:14:15 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 9 Dec 2011 12:14:15 -0800
Message-ID: <4EE26C16.8040707@windriver.com>
Date: Fri, 9 Dec 2011 14:14:14 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4EE17931.7000609@googlemail.com>	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>	<4EE20646.2030300@googlemail.com>	<jbt2rc$l31$1@dough.gmane.org>
	<4EE2305B.5030407@googlemail.com> <4EE23411.2060907@windriver.com>
	<4EE25A0B.7070309@googlemail.com>
In-Reply-To: <4EE25A0B.7070309@googlemail.com>
Subject: Re: packages versioning
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
X-List-Received-Date: Fri, 09 Dec 2011 20:21:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/11 12:57 PM, Mr Dash Four wrote:
>
>> The creation of the filesystem image is driven by a number of
>> components. Basically it works like this:
> Thanks a lot for that - a good insight into the workings of oe and
> bitbake. I was hoping there would be an easier way to configure/change
> this to what I want, but I see that it is much more complex than I
> thought initially.

Ya, I created the spreadsheet due to the complexity.. :(  I like the flexibility 
of the components that are used to construct the image packages, but there has 
to be a more transparent way of doing this.

>> I have a spreadsheet (OpenOffice 17k, or Excel 81k) that lists all of
>> the current breakdowns.  If you are interested send me an email off list.
> I am interested (excel would be nice, thanks), but don't know your email
> address (all I get when responding to 'all' is the mailing list email
> address) - if you know mine, you could send me that and I'll have a look.

(Sent as a private email)

> I take it there isn't an easy way to see the hierarchy of all
> packages/dependencies involved in a particular image, is it (your
> spreadsheet may be good, but I suppose it is static and reflects just a
> current snapshot of a given packages/dependencies and that might change)?
>
> If all else fails, I might use ipkg on the target system to uninstall
> the packages I don't need and install new ones - not ideal by any means,
> but this is what I'll do only as a last resort, if all else fails.
> Thanks again for the thorough response!

As Gary suggested in another email, "hob" is the best approach right now.

You can certainly remove binary packages after the fact, but it's much nicer to 
not have to.

--Mark


