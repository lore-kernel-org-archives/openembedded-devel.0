Return-Path: <mikko.gronoff@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0100.outbound.protection.outlook.com [104.47.2.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4795865CB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TRKLRqGds1wgy8OJYHmANYBt3Xay8bskULfzhdq5B0I=;
	b=iJLha73Elu4fBN8CM2Kn1NSIZNhnca4p4TGHMsZI7VTBL7vJ3GW+IgSubwZw2n5wUEoRaletBbdCsVSsXnL2WKnHHwN3v0R5qdgOiC6TkZB8KRWQVRCRzmGjpJXGrOE6cXI9Ld+7J7HWe53qJdbwkzUCr3r96COog9mvR7mAJHM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
Received: from [10.9.21.35] (192.89.120.53) by
	HE1PR0201MB2171.eurprd02.prod.outlook.com (10.168.30.146) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.845.12; Mon, 16 Jan 2017 12:43:15 +0000
To: <openembedded-devel@lists.openembedded.org>
References: <1484363626-12770-1-git-send-email-denis@denix.org>
From: Mikko Gronoff <mikko.gronoff@qt.io>
Message-ID: <72187853-9f6e-e0a0-b09c-c87060ae182e@qt.io>
Date: Mon, 16 Jan 2017 14:43:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1484363626-12770-1-git-send-email-denis@denix.org>
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: VI1PR0602CA0007.eurprd06.prod.outlook.com (10.175.26.145)
	To HE1PR0201MB2171.eurprd02.prod.outlook.com (10.168.30.146)
X-MS-Office365-Filtering-Correlation-Id: 54f6e881-a2aa-4635-3596-08d43e0d3e05
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:HE1PR0201MB2171; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2171;
	3:Yxu6/E9h1ba5LmQ+kRQeJFOqr6Fz8QGXOLjy7Rn94ohKhA4Xg/Lx0KwFixxpeDJ0wdIn7otNxQiSPQh2O0mKTpfg8wnh+U0N5Xj94Trhihppw9hE6kebWJVrcYWzbXCx+2WuXEXgpxqQpOdNNu3O+FvdoPtXGHLqhNgrMHPyLEi3xmuiYcriFdvcotWwO1rQN8hyfnT3tiLXyBwwTK78M4Vue+oo2kunsw82+MrYYG0Wf+ibGqTCrpnzvOmLTi4hhTqq7YIYNYaVt1bVlWRcwg==
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2171;
	25:iuJFnat4/hKmFZ2eDdNaSR53O1B4wGTNe1ryZUccReKmKxd0IUpn3Z5huhnBqNVoAxHXavatI/8W0L6xyigbaAx7aUXOj37qaEzfXX0T39r5cICgk2RKC+TOF6FcsBWqykmiWjy5fZahWx9J3Jkw7OvOqpgIR/BdFhx4nVpfVMp1oMBGqI1uxWwEqVh+Ib2ZwajY0zQhvxjdLScce/hUkGAYeCA7yMwMIlI3KD2tQtWijftz12gl6oMJR6r6vEIrhZC34xJolmlAoBiwV/o1O2tTVxo13FrSmklRE9WhEhsytqOURleuyOIjDP+OIcFrvRKea1hMe7o/e1NZnMaXeLds/aW9p8ozmmR9AOR7vuXpvUfRxPni7MQNO6arLL07WaODQRA7knAGQw61IQbulDsGVkCAQfeGv4SXBcalPXk/almo3IwPW/DTajWLk9n4tIfV8xVkj2KbYRJWr2ABLXOenhjGrh+nKLRNQ5goYsSL5uFv+XLgKxJXYaLUEkjSHyNxQBWDBewp+698XQ84yNRhoA7HSaU+I2lZBDOOjI9Ov5QaIGt8eZlmzpnQQwEA8gcsBKI80DkK3NVHZiIQbU6SGStLMOWR9hIPSPHcj0JX7hkhptIK9o+dP8TTPJzCxbWP4b5t0ImztKHpoHeC1z8lNeOIvzJKh6sgSLQPws9NKEd6o/8BSgfM44baDlTxFueSGULTzDy9vgUvPU0s42TPG4I9wbHDDf3B0r/wawe8vi60bUIrOK/dl6QHKr/RSi4B3HrI0vflpEcvSsEQMg==
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2171;
	31:OKtT/zhJCt4nfi0IEVNk+4jvAJDHFauNWzGV1R0vA+Tp+r0nq4XUeS674mDNpwS74kUxjmVDvnxK8aaUHcKUlLB5D9TS0o8QvElT10Oh7XQophUUxeGm5X60n4vWgGJnHhPTjzbNnvz5TeWkDmgSIC8AgStebUr4IcQjrpc+j5ImrJbAWU7L9u52W7oYbQcpLfIqMPrlX9Jy4xZzwF4Ld4zhJAneiBD12MjNMjpfppbYO0muN4KZoOoD6fzyMOnWKUWbo+RcogaV3EWLC9M3q3K0eFnJ190mshLilBfHdtE=;
	20:EQvfPV2+zbp7YRrrJnHRrO/cjsd7xedeWAXnNPUMyaV2Xco5iY3fjlt0LT2h8pO8xgmxktZb+OIJl+R+JBURQYATz8q7jGYHFIdZ6lX0eMOoe+rCIt/zUd4O1is+sw7cdxJEIfjMS0Lymm5Qsplc4EUjKo0TAd310+mFbgr0ETX2nphOONJuTkFkt97ZxvRg/Z5BJbWD6TV/6ZRw7XTEi9haaan+88nJ49XXY+kd2YsznVwiVsfxi4dlDWZnYbl/
X-Microsoft-Antispam-PRVS: <HE1PR0201MB21712F588DA2E9D7DF7FDCE8E97D0@HE1PR0201MB2171.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(31051911155226);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(6072148);
	SRVR:HE1PR0201MB2171; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0201MB2171; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2171;
	4:d9lCv2fsG6+n9T9AglOxO65UdXozNWdok6PV170ihgnbYk7ksa7P/euAv25AHjaJVdlMypUwrSr3mE1JaXUIaTiZVSgnXxBEEY7d/AZOful6AHD7gHeXHKY90087zvgRIkhRlsCWsBNpaI1pSpqLH10h4oDOFu4p4WGByTfyHsVm5HPhU8VeHo2c4At4nbAtKBoR5vrlo4g5tgyd2R2vLOF6MsMATin6ZFQVe3HxYghnMKXKhYkrjzIynFCyUvdBNV8N3HeNpThE57LLDMT9tdzzFxROVgOeGyAky5AaUz/tbzNmYXVtCTQCdfEJUm2D0CDUkFNCCs9WO6EmP0T8+Tvwv9eX7dB2NsxfePbyDq1rzfCIZvqUpiXcaqY4FMo2q7xpq1mrFfKTdiqRVGnSWp2wwzHgsMhRqcyBu32N8ZgqQKZgpPwcfK5MAwo1yewY7lU/ls9jHnbwRPJ3q6BKM65QlFWFen6tBSHy0q1Z0GOPOtVNXgG3mbMSg+K+5P3sgzPa7EXX9ZeiVC068pJ3/scSxP7gMLa3z1z/kdfDbOS4tuUwBjfZfETO/WSBQhGyAv5MX9/DxJyqNcCHI9EqUXCsayFOR6MJhWtQpAM3XDgVB9HtM7u+bzLk+JkuB1Tp
X-Forefront-PRVS: 01894AD3B8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(7916002)(39450400003)(199003)(24454002)(189002)(377454003)(8676002)(50986999)(229853002)(54356999)(76176999)(81156014)(106356001)(105586002)(50466002)(65826007)(450100001)(101416001)(2906002)(33646002)(2351001)(81166006)(74482002)(31686004)(305945005)(66066001)(23746002)(65806001)(42186005)(575784001)(86362001)(92566002)(47776003)(38730400001)(189998001)(31696002)(7736002)(65956001)(107886002)(4001350100001)(6666003)(77096006)(6116002)(64126003)(6486002)(5660300001)(97736004)(25786008)(90366009)(110136003)(36756003)(3846002)(6916009)(2950100002)(230700001)(83506001)(68736007)(27001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2171; H:[10.9.21.35];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; HE1PR0201MB2171;
	23:nB+voPy9+hiKfWuQX7rMbTahrHZyX++Wj1G?=
	=?Windows-1252?Q?7gaKBvPGVN1GJUz0nQSExDCzcJg6QFAnKCU6dJdBXBzgM6Ga9OuWQyGj?=
	=?Windows-1252?Q?Yq1tFS4l5wKwUX27piBSa1CzFuLq9XGjmqN6eRGBoyFdn5kIzgJ3gXeJ?=
	=?Windows-1252?Q?bCoUiID/qdV1LEwvvD1kpNLsp9B5K2b/fNacghVKAsaBU6JeWHAsh+xq?=
	=?Windows-1252?Q?nfGISplfpCUSxZqezg8eFAQFmsf3KZvlG7eBm7UFWqX/oUAFlv8qG0Dg?=
	=?Windows-1252?Q?yFk3jst4DlImCrShsHdbWnIKK2u/hmOs1yVb456AB1mr/ILY3gLBDPhA?=
	=?Windows-1252?Q?aHbqmt4QE4dIQQCRhtrGU50z2TLD7MgCvKKo7JLxvVwgDsAP6BXSc1KZ?=
	=?Windows-1252?Q?ByPfJL8moQGk8Ku9ovv9WT515j+6vVm0C1L3botBRVgvgt/5O3hX9IvC?=
	=?Windows-1252?Q?SmJTJh5fe7zF+uycCsPxoiVK17JAKe2S8tGoK4K2qaqHd0Ai8DsdfEer?=
	=?Windows-1252?Q?tUl7eyIyHFp2HNuZLhpmOS4tnTkV/W8qsr5I1P+Oq1UOhsJjdeKUKeef?=
	=?Windows-1252?Q?sjJq5KjTW2wl6riAa1HSHlqAhA+NV3KLvufDM/5VC6REzC6CfMEx9eNH?=
	=?Windows-1252?Q?JJZnt1ObwKAaA3NfH+GZ30vPGHl+eWYoVusjUvcNS97GbHO+/xhhVIFr?=
	=?Windows-1252?Q?l0cb/RZLN3t2C439ucPx2KuCqX/E35FffbVwzmnsSLSuk6KUjzmdKuOU?=
	=?Windows-1252?Q?ikvTUBCkyxqvAofFWaEoW17cp/gUgD27n+GnR08hKOkiJ0eHf5bp7qqC?=
	=?Windows-1252?Q?+zHf/9D8qIOaK1uBLZ5w0U8iMmoFTfEu21Fl9xR/pBjg3QvF8qwx5cob?=
	=?Windows-1252?Q?J4iYClb1RM5JecuUTodO6Sc3XOqtv6vhLyT/paud1T9AXQTVr7xU6nQA?=
	=?Windows-1252?Q?fiOWsSNRawyDNHUFjuKaUc+WTopdL6/nPfzxxnhwY9mxHwwXTTCOp9L0?=
	=?Windows-1252?Q?UGMnt6XEwLMNpSMYkdHPUuIWhq7VnaHk6KTvet4ErGdqmDBTJFzMoimu?=
	=?Windows-1252?Q?Bc7vDQjchRrrcOR64dmQrD1dV+5Zgzq0CJ90Z73ps2TUlp1XOd0TiSSG?=
	=?Windows-1252?Q?Kd30/xg4c4meHebYNMXB3vJvXqqtkjKcPGKm9IRC2sRWqnpk/WiC9YVf?=
	=?Windows-1252?Q?tw0DOw9ilygm9pBCjitqmAKHuXKRxMQ0WoBygVoJY0uDvX4X2QfScRTY?=
	=?Windows-1252?Q?sj6RRvkrAlzEmfvaQ+rFsr/QEjFI3VMOY1e/yIPxfFZjl0Xkb40YH3U0?=
	=?Windows-1252?Q?WA8E5/yLZ8aMhBBdZdfktTqXowwyr3VW7W7zf36jA2mIP+yEHb7dVthx?=
	=?Windows-1252?Q?B763pJPzzftfVpKqaCxYYRXumUJ2n/qYYmTHc7a7PQ9fU27N9/0wj9qg?=
	=?Windows-1252?Q?aZRFD2aRmGK6lVyoYUL6/AqdvYicvgX5RyEe7F9TK5JgdOh4pOpAzI95?=
	=?Windows-1252?Q?wytQSwOMxxw2Pj2F5J4NgsUHnYompNNDAmt1EmvfYV/CqqAIN0/HeDeu?=
	=?Windows-1252?Q?BZAPYs6FsYXd7xgk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2171;
	6:bqJv4pMZJMSPa0sZ+Uql2e5lLNtU9q0qS/l6V+sXOIS/qamJksmecQwtZhjgVInnI4EEWdgs4kasOk5VSQtuES6EQiMFEPiJ2R4MfnJxrzz8kHbKN2Sh9BZzevba4iUPkoq/btaq0HxkTN/WOV9obQ8CHckiG3Y7zn7MNyMOtPG/P2/bvdyYrhCF1UjZar3kxHzOjUYjMayXATQbHQQ0qK4kjlFWAV1JVNN+1fFzNilW/HJKybf8CvsrZ2KSgImRicS4hyRApjg5EvCiwwy89bD7/21VY8wWYenEhS/bLWszBn4C7BU2og3WzmDdV+qAc3NqO2TLOC1AafkhLVEADl3I+79J2xbEPCaRabVud919enkyK5XPbnutGdV0I/0Qrbf5GXTPbLGArdA/Xu73OB+aqTD1Py+fleoP339mMh8=;
	5:aGsKsq2vC2oobT7I7hEmO2RRXCv8A/a/RMih2rAenYvX9JzioSMTnKHCg/h94D91jw3rJtM4dYu6Ny9kcPz5M7vUmaKUh4iq9BMx+bYFr0o8ZNrfqfr9L719LZtv0OT0ka5LdZhtBQnS0jrL35ePaw==;
	24:2v94RufCxTUO6pY0UeuOgMImK4ZDR8O+rY0uDH1lehcie1gi2nSjRdHBE21MWEVxudaLtIXaDsASGTzRaD1MvlEAga/sdTuXkY/D7b4rwyY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2171;
	7:Bd44hcVsNmZH4EMeaDitVd867BensbiFM4LzPNz5XCUOu64tYITdKG1qEmIwaof1C1oJD4DimK0sGxEbLbUaGPbVqSK/Xa/cYOqMJ/Sp8CIlxDlj9NDN5u7L/d2S/5bhUI2BXibamda3RTvzXBnWhz5VI9FBbuh+z+nr4KUQ2q4fQ9wDu/G+BePGEtVHYX1rbGJEXk5J8XY3yF7JcqLwqW8YKKdJuG7wF+LHNfGd1b6ItPHqfsIU24fwya3MqJjRuWU/rpiEiOHBdthN7EANwwvEt8f30oxxBcScTI66eS7l8+FZZcyqop5dSZVHikEL8U9sfN/13ixCs0fduiGDgMQHOGLsKp2YM/sTegPtswSEz8ZKS2UIQA5lXcG3uFZk94jZYxSRXcAQ30qswL0UNsoi3pkaa6dpMKmLKLJvalJdYVMtl4wZuKUSv3oHtwgiL03DTT0NW8PD7PJon9o4gw==
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2017 12:43:15.9295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2171
Subject: Re: [meta-qt5][morty-next][PATCH] qtwebengine: update SRCREV due to old commit no longer being available
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
X-List-Received-Date: Mon, 16 Jan 2017 13:17:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

This one commit was missing a merge from 5.7.1 branch to 5.7 but it's 
coming very soon. The merge commit is already done, it's just a matter 
of author submitting it in. Should be available very soon.

-Mikko


On 01/14/2017 05:13 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Previous commit used for 5.7.1 baseline is no longer available on 5.7 branch.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   recipes-qt/qt5/qtwebengine_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
> index 4712441..210f791 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -122,7 +122,7 @@ SRC_URI += " \
>       file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
>   "
>   
> -SRCREV_qtwebengine = "9cc97f0c63049a8076476acc89c875c9e240abfb"
> +SRCREV_qtwebengine = "6766290699acd0d73c81cf690012d52729e518b9"
>   # This is in git submodule, but we're using the latest in 49-based
>   # SRCREV_chromium = "c109a95a067af783e48f93d1cdeca870cda98878"
>   SRCREV_chromium = "b3c79e92f0a631273b639af171e59f4c367ae02e"


