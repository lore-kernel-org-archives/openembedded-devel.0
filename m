Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0086.outbound.protection.outlook.com [104.47.41.86])
	by mail.openembedded.org (Postfix) with ESMTP id 959BF787F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 01:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=GlbB5uCg/lE+8kPvkQOXBIJ5jAif26OyupSjwQ5m6wY=;
	b=MHjcgM5DD8mQCqSIrwsrjKH7IzEvhInucP4m5Fzu8h5HQ5T2dBd9/sCp8c+0gSRtmX+9AbYSRR3xWKwBDGMYAUOw2ivKif+9lp1ctOoN1X5qZhKcGRLavwgrx8t5hguPctWVuwt8vWXMNh2WMawiIKwT//hA0Ey2nGIUCg1wRaw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	DM5PR0101MB2938.prod.exchangelabs.com (10.174.183.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Fri, 17 Nov 2017 01:10:58 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <20171115203806.25651-1-mkelly@xevo.com>
	<20171115203806.25651-2-mkelly@xevo.com>
	<CAMKF1sqxrpmQWyo9L0WAUzUBdpS27kHjPD6LDXZ9D7-EEH+Riw@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <80600c8e-f34c-829b-865a-4e481f3f84cd@xevo.com>
Date: Thu, 16 Nov 2017 17:10:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqxrpmQWyo9L0WAUzUBdpS27kHjPD6LDXZ9D7-EEH+Riw@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR12CA0054.namprd12.prod.outlook.com (10.175.47.144) To
	DM5PR0101MB2938.prod.exchangelabs.com (10.174.183.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc51c1b0-7921-423d-691e-08d52d580fbd
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM5PR0101MB2938; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	3:IehhU+zGJtFHZLgtPafGh4coJioF7bcgecXO3DTTlYk7/vjkvazgMGG8x4/3+LRfQFF9fwa2v+r4qcBYxYKxrlQNMqo7WuvNe5VQD1Qc//jpwYcjFgzPw8zkCNdrwVVGYVawDXLWveQAbZORzjVQbUiLl455TkUnkbqu+cSANKradMfdIstq/QHhJYQzwwpWnM3yAfUNr733xnjraPW6CN2fN6z46MFnLGILgGA/jHcqn9uFgCe7u+h2UieRDOEX;
	25:473OqmWEEHJAGrxIsFBhjlNBYo/dMtG2+n7iyxJr8taVpAWRONiYpX5FnWSF9stnhIMAa7bVBZw7HAJ+Q5COr0ZLIYv+JRb8p4Rl52lq8lwPWNGEqHpngfCqwid7JdcB3zkPT7NCwZOHbG1KMih98JRjQfJdAU0oivy0Frx8HC4h9Ecd98qgwfVHSMD6LAA5Ftt7/vd8Sc+9wYCPC4avuQBLYI2KRkmrGMg0Pl5a4MYDDGA8TIWnY81E0TO9dT7ZrSq3qRJ60ro/3SCp8PT27zs1xlOBy6kEUN+qFzyzHu4x5Zb3HqcQT2wFjqH4WxmmkRcZ5dTvlvtpvGW0tCOkWw==;
	31:nq7L+m789cVSjlcdCD35YrWmlb51zozzcsivjW+A030fYKX7VT2FVe2qIdSNBkcCe5HltamyaBCFRk/fhrn38V1w3a9DuRFsbQbD9WhUcp8ciOFXreU3BV7IA8vsK1G5NdsM+EPaE47vnP1Zu08SE/OFjUthwICWUTQvCFuhuF2wN/ciYF3d7no0stgjiC8txaLEAQ+t7O9qZzaJExPG0CJjc9gs4pXYOOLNKHMbvrg=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2938:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	20:GnJzRg9j+uKRMos7wCx3xYpfhfFNju//pBDLKjKXqHZUK18XmrdwIubtMgU9NYFu2AXIXAuedtIHiHAN09wHmswFkbAfCaNsXIYjdDy6vZ1AB8fXXixTdaovMZJk/WPfXKN9iLEzH8eIyA6AeGOmO+pBq1srWomS4CFyAcLqLXlNLYFspD1C4ieEbff2b0qD59IHtJF+HJoX9tKHiSyu3oI9RyEdb34pcoUFXrBIRxXAkZwkRPlGEU1Gh/kBWMOImgYWQb+frHGhTTZdSJMFQC8gCrK3WmdPR0+7U49AXkWx33jZoFp/8ALwJjK6KyQecfQrdPuD4VBnASIbi59fTf1yEHFMrFGjSD76gAhWgAVDmKgcdUZJW+o3/CapEudPSRxCloyJ/HvEf9XYgDZKMNIU3oKht3s6n3pwj3o4Ml0=;
	4:TYwjf5oyCnTgdDrgDAORwRbI9Tl6Mu/YJ+4WWeTjwHHHZAf18it68SdJ+QnZ6emQZRl64qY7jVE9AYQVd6Qj9FJ3fcZYah6i6DmgNschyooLim1loRZyJPvPMzxHmHgoctYv4Jfr/JFA7/y2HmEzqmuFnV18tVgV1gQ6509XmYMF78OmLHheiOUALQWA0Ioo2fIsYL+3qhn2GMLZ2UzGqVB4PqiaostMluw9a7Iw0NOz1ow+k/R8FJoWN6fMPjR1o/7mVi9AvnF1tvQkmaDlgw==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB29386D98F1B222F018F17B8BAB2F0@DM5PR0101MB2938.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(3231022)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123555025)(20161123562025)(20161123560025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2938; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2938; 
X-Forefront-PRVS: 049486C505
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(39830400002)(346002)(376002)(24454002)(199003)(189002)(5660300001)(6666003)(16576012)(6246003)(77096006)(106356001)(305945005)(229853002)(23676003)(64126003)(7736002)(65806001)(66066001)(97736004)(47776003)(39060400002)(31696002)(575784001)(65956001)(478600001)(6116002)(189998001)(86362001)(105586002)(53936002)(3846002)(68736007)(6306002)(2870700001)(16526018)(50466002)(31686004)(6486002)(2906002)(81166006)(58126008)(76176999)(8676002)(54356999)(101416001)(81156014)(83506002)(4326008)(6916009)(2950100002)(8936002)(33646002)(50986999)(65826007)(53546010)(25786009)(67846002)(36756003)(316002)(90366009)(133343001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2938; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzg7MjM6bkdzQnNkd2pYNTk0cEtZcFk5bjBnV2Vs?=
	=?utf-8?B?eWVOcU5JdXJaU0JPSjl1ZFplZDNJSWU5MGdNR3dXSEc1U1JYQ0JxcmdhYmRi?=
	=?utf-8?B?WkJ6Ui8vY3NROVdWQ1ZtMERCSlc1TUR1aEl1dHlUN1I4eVZwbm4waUhtak5Q?=
	=?utf-8?B?dXFvakNpS1hNQXh4L3ErbGdlUVhWUjRaa29VNHlUaGs2dXZ5NHBldnQ2MVVp?=
	=?utf-8?B?dGxBQlE1SjFveXcrRHFaTEF2cVZ4OEI2TjE3d3VoM1dqcXI1WldkRkFhU2tG?=
	=?utf-8?B?QUNSL2dBeDlia2lJYVhkUVNjWTJnTFBKZmpGQW9PN0FTelJJSkF1Q2dFWVlG?=
	=?utf-8?B?bm5TVHREV3U0S2NKSCs5QnV6emRFd2ZpMCtMYVdBMkkwYy9EOTZiYUNiTnJY?=
	=?utf-8?B?UitGUEtPNEswOVBTQXVvalFhVm54VTI5cFVNemdjSzJEYitBaDNRNXlBY0dB?=
	=?utf-8?B?ZWpnZWtTM1RWWVliR3JCdkZHVDZWYm1wL2tmcXpuUnhjZDExYkQwSElRY0ZH?=
	=?utf-8?B?WkNtTkZDUGQyWmtMVk5hWnZLUUpsNlRIMTM2Q0dTQmd4VlVHbXR6M21ZdTFh?=
	=?utf-8?B?UG43R2J3Nmp0dzhjeURZVDJZS0cyTTFCWEMxbmFYZHpWcEhYb21JRmsrNDh2?=
	=?utf-8?B?d28vYXpPUG9YQ1h6MTE0cTRhamMxWFBHZGh0c0xONjVmZFE3MTFSRmZlczFJ?=
	=?utf-8?B?eGdweGF2YjIrUjlrQ0tOZkdqQjZzMmliNCs2bVlIeERrOVpmdDBHb0lBNzdS?=
	=?utf-8?B?VUNFbzZVZFRjUGJjZDBQcjdkL3hiRzNMR2M4MURIRDFCeVhTSVBGMlFWSWJw?=
	=?utf-8?B?eUtiOG5sbDhHSkF1dUdjQmJFRnNvbml2V1FDS0VjM1o2UkNUVHB2SGllYmpH?=
	=?utf-8?B?N2hzbFRnblRpUkpKV0JGdStuZXo2V3VlZjJRYW1NQ2VNOVBzak4yb2Zua0lp?=
	=?utf-8?B?ZzFzblBMNW9xbU1LZ1M2Z01NQkw0aWJDQlRWWm4yREc1Q0JId1ZBeTgrUUQ3?=
	=?utf-8?B?RWZyMUtRS2E3WEp5cFJnWWkyQkR3N0x1MkdlK3FyaXhvZzlZajlmaEhhUkF3?=
	=?utf-8?B?TmxiNFVMOERjaG0reU9YNWJ4Q0pybVNWOEdNZXZOYVdCc0JiTnlVaXB1S0pD?=
	=?utf-8?B?QWIxSTlpTE9UL3FlSFpoQlozdkk4cER2NjRod0xPc3ZxQnNKYXBWcFpMQjVm?=
	=?utf-8?B?ZGVEVXVjOGtSQTNLYlNnY2pLNjBEV0xmb1AvcFBiaERwMUhmNG5NK0IwNW1s?=
	=?utf-8?B?OTlyRGtUZG9DQlNrQmdwVGo5aFJpR1pHWFF6Nzcxbzh5aUg1MW0rWnZqd05L?=
	=?utf-8?B?TzZWaE9DTy81aVBKc1pDbmNsbVpDZlhvM1kvVVpvS09BMnIxZkVRYVB5d3VZ?=
	=?utf-8?B?S0V2eHJoelRnek9ObWRFTk9xaVRqbDB2enFSeUxhSFZqOVdSN2RZZ2QxRERh?=
	=?utf-8?B?ckdNaEwzOEdOUzQrUU5PbXdQTktuaXRaY1hwVytud25EbkNHRkpMZTJWU2Mz?=
	=?utf-8?B?dGgyRzgxMDVJbGZzbzJyU29sSVVXcEU0K2Rid0EvRzZWUGkwUzZQUG5CMVdJ?=
	=?utf-8?B?MjhEY1AyMW5DNEF0TW9ma09kNFhYU1BwU0JpWjdoNVZiM0NxNysxbmw4UGR3?=
	=?utf-8?B?V1dFbkRkdndRYlpQRnExWHU5WWZwWGhTNEdDRGxXa0JMMDBmTTVKKzFkM2Z3?=
	=?utf-8?B?MnZUaHFjcGxGMjlhbnlxWnB6T3JoUytnanZSS3lmcW9iS3lXZ0pnREcwUDBa?=
	=?utf-8?B?Q1d1aVk2SjExMUZLUGhPZisrMVJ5WHlxNXF2WVdnVjFFUnE1ZmdMak4wcXRr?=
	=?utf-8?B?bVFOVmJsZ2JmNDFTU3VKUC9vZXhERW95ekxvZzJ6TTJUTENVUFZvUWRaelRG?=
	=?utf-8?B?LzdaU3U2dCsvRDdZNGkxL2NMcm9mUDRkaEFodlhtcGt1Y3ZwVnFlNkNHZnkx?=
	=?utf-8?B?UXRMTm9yT0N1akJSS0hBTno4UENWRFU5Y3FlUXVCR3lndUhVMCtoUmY1ZVpX?=
	=?utf-8?Q?M99+NBHf?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	6:3KjMh6j1Ju2CCuXUzt2wvRbuBR4vZ1g/b+y5h0yPfq3JG9ha+6sIeKy9qqTgnQlPmUfyLsQjikyE0aOgQ8jCscZiPEL07onWuw/0H9WjFqHqLrZlOt5NlQ+QPT9C/kbMJDJLDj6K+/qJ5d8BFu0I9C/GV80PqDFW7mT4cAMFVt5NvvMFFz1zUc9K7XTqNzMXgyaSV5ImogMBVULwYyRs+H5GkxbuoCZwDZbc2GxCAU0syIhE2qdUKe0WpsErB/mOKX2504dJ2XTZW8u34opyhaSM31EyuZb2x0KNHwdTiguwSSDzYGqA/LykeKLW5sMVuqzRjU0mvAwpwXmTWcIzX98cRRmmliGs9UkM7bRUArI=;
	5:4wzeq76ZgKKPdSPSRlbt9vVcCV+vxU3RZz0OY/3x9OosEbz1P3szmTOX/r192GgyPVb1Vd1VrJcZYZUai6eV7OTZXSf5lGq2MLgjlpS+iOd3lX/LyDs8dtoqhUu0x/s/DJ8/qUXgDBiQbHO8iJnqiBIpiZpDeBwYTGRpgRrd1qY=;
	24:dzOXwJnfwh3VC0sfR6Uj5Yv/dOaOJEod9F65Sk151JB30Jtg1C7C5N+wEwEqOpj9TET7sUPagrShdGdrJZ4iDZazLHTIshWTiMEr5LVarWU=;
	7:jNQDiMi1fDl1+61j4ef5osrD3dy3ReMBeqFe/UBmskPyyii2lqxfIUfv64GiND0Er2vR3APctNzVBpsNnvvjQWRlsX4pDS3WMxclneEYRwElYVcHASL78Ukcs2W5ughW8/ZHL3bB9gpk3ro1QBwmXGv6f6Unsee+K40U6lgLGz7XkOqWCybMD+pnyc7AiLLiUQd/9qy3kLmURMC0Z4JlU5oY0I5kyoWOivphcz6+nfEOq5IKIW6eakc41qx75qNO
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2017 01:10:58.4892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc51c1b0-7921-423d-691e-08d52d580fbd
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2938
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] gpsd: add gpsdctl@.service for USB autoplug
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
X-List-Received-Date: Fri, 17 Nov 2017 01:10:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/15/2017 07:13 PM, Khem Raj wrote:
> 
> On Wed, Nov 15, 2017 at 12:53 PM Martin Kelly <mkelly@xevo.com 
> <mailto:mkelly@xevo.com>> wrote:
> 
>     This service allows gpsd to automatically recognize USB devices but is
>     currently missing from our packaging. Without this service and the
>     matching udev rules from upstream, gpsd will fail to recognize USB
>     devices when they are plugged in.
> 
>     Signed-off-by: Martin Kelly <mkelly@xevo.com <mailto:mkelly@xevo.com>>
>     ---
>       meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb <http://gpsd_3.16.bb>
>     | 3 ++-
>       1 file changed, 2 insertions(+), 1 deletion(-)
> 
>     diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
>     <http://gpsd_3.16.bb> b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
>     <http://gpsd_3.16.bb>
>     index e94d6a108..80d9b0edf 100644
>     --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb <http://gpsd_3.16.bb>
>     +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb <http://gpsd_3.16.bb>
>     @@ -80,6 +80,7 @@ do_install_append() {
>           #support for systemd
>           install -d ${D}${systemd_unitdir}/system/
>           install -m 0644 ${S}/systemd/${BPN}.service
>     ${D}${systemd_unitdir}/system/${BPN}.service
>     +    install -m 0644 ${S}/systemd/${BPN}ctl@.service
>     ${D}${systemd_unitdir}/system/${BPN}ctl@.service
>           install -m 0644 ${S}/systemd/${BPN}.socket
>     ${D}${systemd_unitdir}/system/${BPN}.socket
>       }
> 
>     @@ -121,7 +122,7 @@ RDEPENDS_python-pygps = "python-core
>     python-curses gpsd python-json"
>       RPROVIDES_${PN} += "${PN}-systemd"
>       RREPLACES_${PN} += "${PN}-systemd"
>       RCONFLICTS_${PN} += "${PN}-systemd"
>     -SYSTEMD_SERVICE_${PN} = "${PN}.socket"
>     +SYSTEMD_SERVICE_${PN} = "${PN}.socket ${PN}ctl@.service"
> 
> 
> This should be BPN as well I think
> 

Good point, I sent a v2 patch series to fix it.

