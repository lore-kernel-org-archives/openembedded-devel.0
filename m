Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 29580 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Jun 2016 17:15:56 UTC
Received: from mx18-13.smtp.antispamcloud.com (mx18-13.smtp.antispamcloud.com
	[207.244.64.182])
	by mail.openembedded.org (Postfix) with ESMTP id D6A7A60767
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 17:15:56 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1bACuS-0004RB-Tq; Tue, 07 Jun 2016 11:02:55 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jun 2016 11:02:49 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <57568DB8.6010209@topic.nl>
Date: Tue, 7 Jun 2016 11:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw3m8KyO/e3OFX2RUwx7xEEvBqm3RvM5N1UuDkdL5rJuDWYSHbx/2iEXlZ3vyVN/fF+Iu
	NqWVQJTrKtJ9y7p4b9mIqVXVcArPTKJ173BjamDICPT5v9s5yYGFyGM7BAaP3Xg9i+nEmou2UMHg
	mE6z+uPpnAH3Z/yWJ/1UVv3cE79AbsKWNgh+cdzn4xX4/ZcAd97TYL+UsYcshIsnHUvaRijXYu/I
	cQJuWHlbnMOsg605uIsVkmFiKN4g6sbzZ/DG2bYbk+PuJAkSa01TMfeJ1noZd57uU+vYl1kpKtSO
	Wrva29UU3frYgZ0TR7bi/ToFn8OpyKA69LF1Ge2GaGfxmfqxg/+p2ZjpNnFVhpbuUAsdZ/RlU1v5
	1vXjaHvNDaZvYntRBOMqkNRCP7fVbbh/uqGqlWnJ+tQkP1HvU99403+oc/e1rVLsLRRzePcb6lVD
	iRz9D+/9oSt5jUrIaWXjdPQICGSqDH5ZxqCCXyEbbNwy6cMiiH3izwFu+xwdVhZyX5L5g2m8DCGg
	UHHxn6e6gArzX5NI37q4AO7kJrqw2Qae7o6cW64wNyLmPPFRGqR1pJnckpWaLvahyBjmQxBKOzsM
	ppduCVf+i9mk5WykwrtPRhC1JeifEZi+kYyqZHU3A+NiHxNXMYbXox8YlpbR9REN2vxcDlHOkrTL
	QldwJ2dGzJxsPdynu43xqHKIl4dwQzEvuGslKTrRIXcXpFg5ivY=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.0016904308251)
X-Recommended-Action: accept
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/3] gitkpkgv: Ensure files are closed
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
X-List-Received-Date: Tue, 07 Jun 2016 17:15:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFLooks like regression in Python itself?

In both Python 2 and 3, the file is closed properly if the file object is n=
ot=20
being stored:

 >>> import os
 >>> os.listdir('/proc/self/fd')
['0', '1', '2', '3']
 >>> l=3Dopen('/proc/self/stat').readline()
 >>> os.listdir('/proc/self/fd')
['0', '1', '2', '3']
 >>> f=3Dopen('/proc/self/stat')
 >>> os.listdir('/proc/self/fd')
['0', '1', '2', '3', '4']
 >>>


(file descriptor "3" is the one being used to read the /proc/self/fd=20
directory, "4" is the one used for reading the stat file)

The "with" construction should not be needed here. Something else is causin=
g=20
this (e.g. nested function definition or exception handler?).

Mike.


On 02-06-16 11:34, Richard Purdie wrote:
> This avoids warnings with python 3.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta-oe/classes/gitpkgv.bbclass | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bb=
class
> index 1cba00c..4866fac 100644
> --- a/meta-oe/classes/gitpkgv.bbclass
> +++ b/meta-oe/classes/gitpkgv.bbclass
> @@ -87,11 +87,13 @@ def get_git_pkgv(d, use_tags):
>
>                       if commits !=3D "":
>                           oe.path.remove(rev_file, recurse=3DFalse)
> -                        open(rev_file, "w").write("%d\n" % int(commits))
> +                        with open(rev_file, "w") as f:
> +                            f.write("%d\n" % int(commits))
>                       else:
>                           commits =3D "0"
>                   else:
> -                    commits =3D open(rev_file, "r").readline(128).strip(=
)
> +                    with open(rev_file, "r") as f:
> +                        commits =3D f.readline(128).strip()
>
>                   if use_tags:
>                       try:
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






