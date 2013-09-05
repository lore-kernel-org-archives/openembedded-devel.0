Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id B332C60F1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:10:26 +0000 (UTC)
Received: (qmail 6809 invoked by uid 89); 5 Sep 2013 12:10:16 -0000
Received: from unknown (HELO ?10.0.0.129?) (erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 5 Sep 2013 12:10:16 -0000
Message-ID: <52287493.9030107@movis.dk>
Date: Thu, 05 Sep 2013 14:09:55 +0200
From: "Emil R. Petersen" <erp@movis.dk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1378382068-24795-1-git-send-email-javier.viguera@digi.com>
	<20130905140917.48edcb06@e6520eb>
In-Reply-To: <20130905140917.48edcb06@e6520eb>
Subject: Re: [meta-webserver] cherokee: fix SRC_URI
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
X-List-Received-Date: Thu, 05 Sep 2013 12:10:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Which would also invalidate my concern about possibly insecure 
third-party mirrors. Fantastic.

On 05/09/13 14:09, Eric Bénard wrote:
> Hi Javier,
>
> Le Thu, 5 Sep 2013 13:54:28 +0200,
> Javier Viguera<javier.viguera@digi.com>  a écrit :
>
>> The package is no longer available in the official cherokee site,
>> so download it from a mirror.
>>
>> Signed-off-by: Javier Viguera<javier.viguera@digi.com>
>> ---
>>
>> Notes:
>>      To be cherry-picked to Dylan as well.
>>
>>   meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
>> index 265e24e..4b2d68d 100644
>> --- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
>> +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
>> @@ -9,7 +9,7 @@ PR = "r9"
>>
>>   DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>
>> -SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar.gz \
>> +SRC_URI = "ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
>>              file://cherokee.init \
>>              file://cherokee.service \
>>   "
> in fact the correct URL is now :
> https://github.com/cherokee/webserver/archive/v1.2.98.tar.gz
> so I think you can switch to :
> +SRC_URI = "https://github.com/cherokee/webserver/archive/v${PV}.tar.gz
>
> Eric
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

