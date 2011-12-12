Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RaAuw-0005ga-KF
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 19:48:04 +0100
Received: (qmail 4805 invoked by uid 1003); 12 Dec 2011 18:34:24 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Dec 2011 18:34:24 -0000
Message-ID: <4EE6492F.9030402@balister.org>
Date: Mon, 12 Dec 2011 13:34:23 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1323707082-9185-1-git-send-email-philip@balister.org>	<1323707082-9185-2-git-send-email-philip@balister.org>
	<CAMKF1soquX6jz+ZFpUEgWPkAUFxhcHXBQSug7tFJck8y+1QKng@mail.gmail.com>
In-Reply-To: <CAMKF1soquX6jz+ZFpUEgWPkAUFxhcHXBQSug7tFJck8y+1QKng@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 2/2] gvfs : Fix build failure due to introduction of host includes.
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
X-List-Received-Date: Mon, 12 Dec 2011 18:48:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2011 12:35 PM, Khem Raj wrote:
> On Mon, Dec 12, 2011 at 8:24 AM, Philip Balister <philip@balister.org> wrote:
>> Tested with Angstrom on usrp-e1xx.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
>> index 5a230eb..fd4a089 100644
>> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
>> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
>> @@ -14,6 +14,7 @@ SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
>>  SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
>>
>>  EXTRA_OECONF = "--disable-samba \
>> +                --disable-archive \
> 
> You are disabling archive backend explicitly. It might be that someone is using
> it successfully. Why does it not work ?

With it enabled, the build fails because it looks at host includes. Long
term someone will likely fix this, be in the short term, I need this to
work so I can move forward with oe-core based stuff.

Philip

> 
>>                 --with-samba-includes=${STAGING_INCDIR} \
>>                 --with-samba-libs=${STAGING_LIBDIR} \
>>                 --with-archive-includes=${STAGING_INCDIR} \
> 
> the above option is not needed when you are disabling libarchive anyway
> 
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


